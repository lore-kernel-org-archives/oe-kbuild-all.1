Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF207F7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 00:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WT+qsLP+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698365815; x=1729901815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PlxAjEVCxpSUx3YwWO99CONoWdtgeJpCGdJqEermYWM=;
  b=WT+qsLP+x/u/1IsyvbNKloe2TZvnneyKuBLPrMQJ8s7nK6ZEg06a1dIb
   xUtjYaQf5+DRTya1dBspuB5Mt/C/cZadhD0pzZuRqByFgx0a+rX2hCAZ3
   eQubkU/VMJYDXA3DjdFeoB3itkLKIDvZnifcjYatiheFIhHRP4zZkd+Uj
   1zrj8JrnMJK2fQjrXShgyfGZI5EUMZ9Hc3Ag5hsmA0QNYjLpsyRx6ZMD6
   frnEc8odph6ym+pn8I9AzDhZjuugwyW5+MD1cT3QXHg8qS32AmCQ7J05H
   3oOb9IQPvEtPQCRLZLsevcV7WBVn2Ra3fNtp9NtU7JB0GANT8rgFCo8Q4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="9219109"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="9219109"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 17:16:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="7049647"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Oct 2023 17:15:29 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwAWu-000AFx-3A;
	Fri, 27 Oct 2023 00:16:48 +0000
Date: Fri, 27 Oct 2023 08:16:25 +0800
From: kernel test robot <lkp@intel.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: oe-kbuild-all@lists.linux.dev, Paul Moore <paul@paul-moore.com>,
	Kees Cook <keescook@chromium.org>, Serge Hallyn <serge@hallyn.com>,
	John Johansen <john.johansen@canonical.com>
Subject: [pcmoore-lsm:next-queue 11/19] security/security.c:3966:8-15:
 WARNING opportunity for memdup_user
Message-ID: <202310270805.2ArE52i5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git next-queue
head:   48698f2e49eb79afb90363e2f68957e2836599c9
commit: 357595fcb7c7dcd515c66e92813d53fc8074809a [11/19] LSM: syscalls for current process attributes
config: x86_64-randconfig-103-20231026 (https://download.01.org/0day-ci/archive/20231027/202310270805.2ArE52i5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231027/202310270805.2ArE52i5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310270805.2ArE52i5-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> security/security.c:3966:8-15: WARNING opportunity for memdup_user

vim +3966 security/security.c

  3933	
  3934	/*
  3935	 * Please keep this in sync with it's counterpart in security/lsm_syscalls.c
  3936	 */
  3937	
  3938	/**
  3939	 * security_setselfattr - Set an LSM attribute on the current process.
  3940	 * @attr: which attribute to set
  3941	 * @uctx: the user-space source for the information
  3942	 * @size: the size of the data
  3943	 * @flags: reserved for future use, must be 0
  3944	 *
  3945	 * Set an LSM attribute for the current process. The LSM, attribute
  3946	 * and new value are included in @uctx.
  3947	 *
  3948	 * Returns 0 on success, -EINVAL if the input is inconsistent, -EFAULT
  3949	 * if the user buffer is inaccessible, E2BIG if size is too big, or an
  3950	 * LSM specific failure.
  3951	 */
  3952	int security_setselfattr(unsigned int attr, struct lsm_ctx __user *uctx,
  3953				 size_t size, u32 flags)
  3954	{
  3955		struct security_hook_list *hp;
  3956		struct lsm_ctx *lctx;
  3957		int rc = LSM_RET_DEFAULT(setselfattr);
  3958	
  3959		if (flags)
  3960			return -EINVAL;
  3961		if (size < sizeof(*lctx))
  3962			return -EINVAL;
  3963		if (size > PAGE_SIZE)
  3964			return -E2BIG;
  3965	
> 3966		lctx = kmalloc(size, GFP_KERNEL);
  3967		if (lctx == NULL)
  3968			return -ENOMEM;
  3969	
  3970		if (copy_from_user(lctx, uctx, size)) {
  3971			rc = -EFAULT;
  3972			goto free_out;
  3973		}
  3974	
  3975		if (size < lctx->len || size < lctx->ctx_len + sizeof(*lctx) ||
  3976		    lctx->len < lctx->ctx_len + sizeof(*lctx)) {
  3977			rc = -EINVAL;
  3978			goto free_out;
  3979		}
  3980	
  3981		hlist_for_each_entry(hp, &security_hook_heads.setselfattr, list)
  3982			if ((hp->lsmid->id) == lctx->id) {
  3983				rc = hp->hook.setselfattr(attr, lctx, size, flags);
  3984				break;
  3985			}
  3986	
  3987	free_out:
  3988		kfree(lctx);
  3989		return rc;
  3990	}
  3991	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
