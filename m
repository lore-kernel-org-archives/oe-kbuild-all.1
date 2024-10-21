Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619F54437
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Oct 2024 09:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729502337; cv=none; b=hfA73nl9xQvLxxmkaR49+rF5qet1jPK9RrKW8/bMfojlodgoaRffbT+tOtmRYp4Fr96sGAjH/8pzz+h7JuW1wYqjdGenAU+gk83YDyuPC3aO4kxMig+906jheYO+T7OGJVz7oIViXcHI5zeJX8eVCRjC/qeVBX1Ze129/ftu1AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729502337; c=relaxed/simple;
	bh=OMtvxLTIBUM+p7M2lbKOik+I4G+14brx0L+h8Ybv+Jk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KNHlDS8HIr6MXHVrJ3kWP1l3Cakqi+fHSWm2F4BIEJeyFj3PyxchscQKWeJwPjFKCQU2qBG1hO/B/MCwJgOUfAVDimNO4Q71pDA7COxhrytlxxG32er8c+f9VeKKbmKXbbgq1toSmlJd5XD8MgfcT2zFoxtJ7iqQK96gGje9de8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Li4wRZz0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Li4wRZz0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729502336; x=1761038336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OMtvxLTIBUM+p7M2lbKOik+I4G+14brx0L+h8Ybv+Jk=;
  b=Li4wRZz0jhQ+vR+yLS9mLa/CXJUv7FHtaHvq+GvpJ2XnrmAkNh4qrusK
   kofrap5EXXtezZwvWDord2YyufXzudQaK0WgqF49nLORhcRWwAtg/xjL5
   ggov84kxs6U8FsOTvkLHzJHIszSFygRHZl6iZnIoA2mFwNrAFuEmcMBh+
   lo4YklwVxHsncG3kMbiYxuf2TZksKU30N6smbRcyDhW8pJoB9ZXXJ0zEQ
   rpaMSLgSkfpVajphzIATANSb4qQ3FUcm29T03pfVo12T3kFMGn3+ODDGI
   JS6lRfsu5ea5/sCuyd4RgZy40ObZkk+xG9QEOMcUp6zRbKYSBcuL04V7T
   A==;
X-CSE-ConnectionGUID: q9H+ouNQQGudxCAJFCiN0w==
X-CSE-MsgGUID: 5E2tD2GmShako50haP1Q3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28926596"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28926596"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 02:18:55 -0700
X-CSE-ConnectionGUID: n7hjTXvnRGikwkTFnvED4A==
X-CSE-MsgGUID: i7XoSUO3R6mY7WCEYB5toA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="116914966"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Oct 2024 02:18:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2oYt-000RP4-1S;
	Mon, 21 Oct 2024 09:18:51 +0000
Date: Mon, 21 Oct 2024 17:18:23 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe-2.2 5/9] kernel/unwind/user.c:191:32: warning: left
 shift count >= width of type
Message-ID: <202410211754.AngdyyY3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe-2.2
head:   757574ba1822accfdae6ec405421f5e2df48fe52
commit: d76cec29ef1d2284f0024c60d736b5ed01f89792 [5/9] unwind: Add deferred userspace unwinding API
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241021/202410211754.AngdyyY3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241021/202410211754.AngdyyY3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410211754.AngdyyY3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/unwind/user.c: In function 'unwind_user_deferred':
>> kernel/unwind/user.c:191:32: warning: left shift count >= width of type [-Wshift-count-overflow]
     191 |                 cookie &= (1UL << 48) - 1;
         |                                ^~


vim +191 kernel/unwind/user.c

   173	
   174	int unwind_user_deferred(struct unwind_callback *callback, u64 *ctx_cookie, void *data)
   175	{
   176		u64 cookie = current->unwind_ctx_cookie;
   177	
   178		if (WARN_ON_ONCE(in_nmi() || !irqs_disabled()))
   179			return -EINVAL;
   180	
   181		if (WARN_ON_ONCE(!callback->func || callback->idx < 0))
   182			return -EINVAL;
   183	
   184		if (!cookie) {
   185			u64 cpu = smp_processor_id();
   186	
   187			BUILD_BUG_ON(NR_CPUS > 65535);
   188	
   189			cookie = __this_cpu_read(ctx_ctr);
   190			cookie++;
 > 191			cookie &= (1UL << 48) - 1;
   192			cookie |= cpu << 48;
   193			__this_cpu_write(ctx_ctr, cookie);
   194	
   195			current->unwind_ctx_cookie = cookie;
   196			task_work_add(current, &current->unwind_work, TWA_RESUME);
   197		}
   198	
   199		if (ctx_cookie)
   200			*ctx_cookie = cookie;
   201	
   202		current->unwind_pending |= (1 << callback->idx);
   203		current->unwind_privs[callback->idx] = data;
   204	
   205		return 0;
   206	}
   207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
