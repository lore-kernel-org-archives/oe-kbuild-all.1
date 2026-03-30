Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BC73A8733
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 07:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774857039; cv=none; b=Mgn3GAFwZ7xb9vlUb+Y2t8fH1kBhFDglS684uac0huaFH4iWroZD5O9JAI31TmLQkJgkhpFRpNMjMM5yNfzHHaTpOU5s05uAVM9JI/y2w4qUwviEqi7laLiH9cZ3+1NFrxu430++HXT7oAsg+gkxWxbLiYEorDjaxJUp1+5m7+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774857039; c=relaxed/simple;
	bh=hz8xo0DzQsdRVgS8sKD/KEIbeoqA0GuAEFlXB1DYolk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q0B8oYPSV7lUPv14QfMcPamKjV2NCR2QeMAHFizynVyRnjgU6xIKcFQGyd9hasRxA04CAshkAZh81SAO+3eZIVopCjLmo3OwPjQEWZhRH71dzn/Wdu081YvPbaiFkqfEyKqumgW/vGBYYdHSH/WgSj0qkUH+urhoj/NxPaDuIT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CO3kmvyW; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CO3kmvyW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774857037; x=1806393037;
  h=date:from:to:cc:subject:message-id;
  bh=hz8xo0DzQsdRVgS8sKD/KEIbeoqA0GuAEFlXB1DYolk=;
  b=CO3kmvyW8cmRFNABJg3Uuy6hR4bR4hHByfZygS4pFK09ANMYWuLL0lp7
   gZMX4JrCAJMcHSVdXFW9C7CXkIAVvHU/csaxGMkl74CJJH8Awehuw8JyZ
   13GfcosBOnAIOykT2am7CFdmmp3in4sa9QMr1blPiypDVNDCAcq1MmF6i
   CrVhbYZio4rFUhsMWSWLonfAzIK1BBV49FSkAMLdukAXC0K9fg6WOOvfd
   qMyWO9IFQ9i72/HVQertRsc7Bdj5e4kiN4G8cEP18mC9VS++aD980WGqx
   oVrwqzwaZRndvxyViLklNTHJCF+mrxXygtp4W/ObKn8EL0cbPjGva2APF
   g==;
X-CSE-ConnectionGUID: gl5JFh0ISIi+sS7XDvU4pg==
X-CSE-MsgGUID: y7SPtuLzR9O2pPGeV+n+ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86535287"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="86535287"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 00:50:36 -0700
X-CSE-ConnectionGUID: cwZyaf7tSw27rNob+Cap+Q==
X-CSE-MsgGUID: mItKGYwVS7uJq9Lm0WWceA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="263912733"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Mar 2026 00:50:35 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w77OK-000000000ph-3kmw;
	Mon, 30 Mar 2026 07:50:32 +0000
Date: Mon, 30 Mar 2026 15:49:41 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:pr/146 1/1] fs/smb/client/dir.c:1110:23:
 warning: unbounded use of variable-length array
Message-ID: <202603301557.Vrut2iAv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/smfrench/smb3-kernel.git pr/146
head:   d290e116f12405d8269c6041cbf68bc924b4cba6
commit: d290e116f12405d8269c6041cbf68bc924b4cba6 [1/1] smb: client: add support for O_TMPFILE (WIP)
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20260330/202603301557.Vrut2iAv-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603301557.Vrut2iAv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603301557.Vrut2iAv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/smb/client/dir.c: In function 'cifs_silly_filename':
>> fs/smb/client/dir.c:1110:23: warning: unbounded use of variable-length array [-Wvla-larger-than=]
    1110 |         unsigned char name[CIFS_SILLY_FILENAME_SIZE];
         |                       ^~~~
   fs/smb/client/dir.c: In function 'cifs_tmpfile_name':
   fs/smb/client/dir.c:1132:23: warning: unbounded use of variable-length array [-Wvla-larger-than=]
    1132 |         unsigned char name[CIFS_TMP_FILENAME_SIZE];
         |                       ^~~~


vim +1110 fs/smb/client/dir.c

  1106	
  1107	char *cifs_silly_filename(struct dentry *dentry)
  1108	{
  1109		struct cifs_sb_info *cifs_sb = CIFS_SB(dentry);
> 1110		unsigned char name[CIFS_SILLY_FILENAME_SIZE];
  1111		size_t namesize = sizeof(name);
  1112		struct dentry *sdentry = NULL;
  1113	
  1114		do {
  1115			dput(sdentry);
  1116			scnprintf(name, namesize,
  1117				  CIFS_TMPFILE_PREFIX "%s",
  1118				  CIFS_DIR_SEP(cifs_sb),
  1119				  atomic_inc_return(&cifs_sillycounter),
  1120				  CIFS_SILLY_FILENAME_SUFFIX);
  1121			sdentry = lookup_noperm(&QSTR(name), dentry->d_parent);
  1122			if (IS_ERR(sdentry))
  1123				return ERR_PTR(-EBUSY);
  1124		} while (!d_is_negative(sdentry));
  1125		dput(sdentry);
  1126		return tmp_fullpath(dentry, name, namesize);
  1127	}
  1128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
