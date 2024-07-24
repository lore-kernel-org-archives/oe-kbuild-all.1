Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5C1139588
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jul 2024 20:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721854780; cv=none; b=jxKpxDiOTwxtf6reIEAiPH34ttqwI+as7idXG40TavMx3ExCPujj/5/G15q+7rAjSGo2Hb/SFXYoqv4iS4u1ZclM+BiXWvK9JelwOzhS+lCNox/tw2YnByCZltH3IVVI3uo5p8WZ1SwRoyZoCiOsY4r/LSkNV+4ckL42pYRFsPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721854780; c=relaxed/simple;
	bh=Vn0XCUpq1T6Fj/1iPMFRy8rFkg0LncskzC6ZCUUgbaE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j2zWgwJOoD7GhdGm8r2qEsOqinuY6zO0FvS9+yK6YbKKE7ZBA3cxUkJ3hAkgn2Qt6XxWYYk9ipWkDp4fistcRzvNPOmeGj95B01Ah2RbRPm4n/DqKE+SlqK0ozq65b+l7i3rKAJ4Y8SI3GozffORdVz4XtfIJyWZ6SZVxiCSSuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ikr5fnfP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ikr5fnfP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721854779; x=1753390779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vn0XCUpq1T6Fj/1iPMFRy8rFkg0LncskzC6ZCUUgbaE=;
  b=Ikr5fnfPjdUpVgImQiSnFCZOkqUqojjsdsZXDg0lkKQpDI7VbDCde7ul
   n9OpeuhSW4i9tejCC4mR05ipBtLsnY67G6RCPtj00muQQScd5KFkkRc6a
   8bztpu6anBeX/mVm8PZVAyvkCQ1NlVbjDysXQcC4d99RK+1SXc8bO1aEu
   apFIoSgnLhyvzp+OljWujd5Tr1vAC2vi2QIfZVUtIGCt9aovJohlpkjjA
   9vtbOvR3fCudGRMNmJD0VuB9XDIz4lAOrReOcCUXcXSrJxRlXO3b1xlH+
   uYb+r1GSs3YB1OjbI5oZKoJSHYI6GPIJJNjujdgxosxL5FCMT3xjKkNK9
   w==;
X-CSE-ConnectionGUID: QlXe2W13TTuZK+OcOHQYxA==
X-CSE-MsgGUID: q6GZ4DUnRc6lWF3P58jndw==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="42089329"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="42089329"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 13:59:39 -0700
X-CSE-ConnectionGUID: FZupuc5yQR+u40fvHFfAFQ==
X-CSE-MsgGUID: /Kf8e0KsR/mx2jJRaBzhUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="52380246"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Jul 2024 13:59:37 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWj5D-000nQS-0D;
	Wed, 24 Jul 2024 20:59:35 +0000
Date: Thu, 25 Jul 2024 04:58:46 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.fcntl 2/3] fs/smb/server/smb_common.h:46:9:
 warning: "F_CREATED" redefined
Message-ID: <202407250401.WHuqB3Kt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.fcntl
head:   58956814948ce62e0573fd2eee77578251a09996
commit: 261896aabb381781033d868e9ad9f6a38d90f1b2 [2/3] fcntl: add F_CREATED
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240725/202407250401.WHuqB3Kt-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240725/202407250401.WHuqB3Kt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407250401.WHuqB3Kt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/smb/server/unicode.c:14:
>> fs/smb/server/smb_common.h:46:9: warning: "F_CREATED" redefined
      46 | #define F_CREATED       2
         |         ^~~~~~~~~
   In file included from include/linux/fcntl.h:6,
                    from include/linux/fs.h:26,
                    from fs/smb/server/unicode.c:9:
   include/uapi/linux/fcntl.h:20:9: note: this is the location of the previous definition
      20 | #define F_CREATED       (F_LINUX_SPECIFIC_BASE + 4)
         |         ^~~~~~~~~
--
   In file included from fs/smb/server/mgmt/user_session.h:12,
                    from fs/smb/server/mgmt/share_config.c:17:
>> fs/smb/server/mgmt/../smb_common.h:46:9: warning: "F_CREATED" redefined
      46 | #define F_CREATED       2
         |         ^~~~~~~~~
   In file included from include/linux/fcntl.h:6,
                    from include/linux/fs.h:26,
                    from include/linux/namei.h:5,
                    from fs/smb/server/mgmt/share_config.c:11:
   include/uapi/linux/fcntl.h:20:9: note: this is the location of the previous definition
      20 | #define F_CREATED       (F_LINUX_SPECIFIC_BASE + 4)
         |         ^~~~~~~~~


vim +/F_CREATED +46 fs/smb/server/smb_common.h

363999901116ff fs/ksmbd/smb_common.h Namjae Jeon 2021-09-24  42  
e2f34481b24db2 fs/cifsd/smb_common.h Namjae Jeon 2021-03-16  43  /* Responses when opening a file. */
e2f34481b24db2 fs/cifsd/smb_common.h Namjae Jeon 2021-03-16  44  #define F_SUPERSEDED	0
e2f34481b24db2 fs/cifsd/smb_common.h Namjae Jeon 2021-03-16  45  #define F_OPENED	1
e2f34481b24db2 fs/cifsd/smb_common.h Namjae Jeon 2021-03-16 @46  #define F_CREATED	2
e2f34481b24db2 fs/cifsd/smb_common.h Namjae Jeon 2021-03-16  47  #define F_OVERWRITTEN	3
e2f34481b24db2 fs/cifsd/smb_common.h Namjae Jeon 2021-03-16  48  

:::::: The code at line 46 was first introduced by commit
:::::: e2f34481b24db2fd634b5edb0a5bd0e4d38cc6e9 cifsd: add server-side procedures for SMB3

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
