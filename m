Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367D836B08
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 12:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GMNWfa00"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701866490; x=1733402490;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7aeLVgiSNbkfr1rewdbtLVTh2gibP+wYPGJehs3VmpY=;
  b=GMNWfa00Dvie68i0BKAgoYQicu7kkubgAgZGpr50S2NfXcOaompvfexJ
   al3yReFm81y7gHN9FtQCeFR01sQk4BFXdP85iX7yiYOLknWxa5sVOtK1v
   0YgDpnS6lmNBfcpLc6NuiHTNOmNyEqK0PJTGto+X82+ryAyn2lNCqhpsn
   Mm/O4t0Y6ypluXhaY50O2+s9lm8BjFj2tCwcKWyqNrxpvPEeGuar6b7UI
   A7Q+41kS4Wxk2pPcyEBrOf/4C1XgtO/bUNJJXnjwfu/uA00bIQRteKqjF
   5hfAvh2R5sX3EOZlxg71aTMNsZ8nIzzwC2C9tmBUbgXpfJ5wlaHHJjzBj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="391225899"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="391225899"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 04:41:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="862098620"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="862098620"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Dec 2023 04:41:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rArDU-000An6-1J;
	Wed, 06 Dec 2023 12:41:28 +0000
Date: Wed, 6 Dec 2023 20:41:26 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5/7] ksmbd: lazy v2 lease break on smb2_write()
Message-ID: <202312062020.FbeMXJCT-lkp@intel.com>
References: <20231204134509.11413-5-linkinjeon@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204134509.11413-5-linkinjeon@kernel.org>

Hi Namjae,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cifs/for-next]
[also build test WARNING on linus/master v6.7-rc4 next-20231206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Namjae-Jeon/ksmbd-set-v2-lease-capability/20231204-214847
base:   git://git.samba.org/sfrench/cifs-2.6.git for-next
patch link:    https://lore.kernel.org/r/20231204134509.11413-5-linkinjeon%40kernel.org
patch subject: [PATCH 5/7] ksmbd: lazy v2 lease break on smb2_write()
config: parisc-randconfig-r122-20231206 (https://download.01.org/0day-ci/archive/20231206/202312062020.FbeMXJCT-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312062020.FbeMXJCT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312062020.FbeMXJCT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/smb/server/oplock.c: note: in included file (through include/linux/dcache.h, include/linux/unicode.h, fs/smb/server/unicode.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>> fs/smb/server/oplock.c:1120:16: sparse: sparse: dereference of noderef expression
   fs/smb/server/oplock.c:1120:42: sparse: sparse: dereference of noderef expression
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +1120 fs/smb/server/oplock.c

  1114	
  1115	void smb_lazy_parent_lease_break_close(struct ksmbd_file *fp)
  1116	{
  1117		struct oplock_info *opinfo;
  1118		struct ksmbd_inode *p_ci = NULL;
  1119	
> 1120		if (!fp->f_opinfo->is_lease || fp->f_opinfo->o_lease->version != 2)
  1121			return;
  1122	
  1123		p_ci = ksmbd_inode_lookup_lock(fp->filp->f_path.dentry->d_parent);
  1124		if (!p_ci)
  1125			return;
  1126	
  1127		list_for_each_entry(opinfo, &p_ci->m_op_list, op_entry) {
  1128			if (!opinfo->is_lease)
  1129				continue;
  1130	
  1131			if (opinfo->o_lease->state != SMB2_OPLOCK_LEVEL_NONE)
  1132				oplock_break(opinfo, SMB2_OPLOCK_LEVEL_NONE);
  1133		}
  1134	
  1135		ksmbd_inode_put(p_ci);
  1136	}
  1137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
