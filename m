Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C561AA1DD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 20:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732998568; cv=none; b=frNVKVNGtzyiTfWjiF5h32yd3G+B5kwjoRjq6Dto0doSJrm3pUaQsC+n0CW7MZzi1n2ocMFWAKFRNkzc7hSpa9I4VLUBe2RmO66ngtsl+5knsoy2bCa9V12YZbaKEAY9vhXDGLd6mg3M9r8eEHqjNsYH45dwVZwtIK46pyI3NT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732998568; c=relaxed/simple;
	bh=kGn8EDwLKIg2/jBAYQuniH8nphdmPqKuXI8bSilRlkU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tf8Uk/SqIKP5R7Ierl4HvVEgjhEsZ7ftxVJiXaXlf31IHkDfqeUqGVU4pJioAx9nSVTH51nYyuwsaouWHB2CQrHiGfWmlIDiYi6p89NZt3m2Chk9z/H/i1S06pb8A1oZ63s/xVjcQaSe02H8GDz88+sQzbmkFesClQjtotvpdZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aM2I/zgZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aM2I/zgZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732998566; x=1764534566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kGn8EDwLKIg2/jBAYQuniH8nphdmPqKuXI8bSilRlkU=;
  b=aM2I/zgZK/LnQZ3demAr7sd11xw+aiOXEP6bgLDAjYUBsyFmatkvgiKz
   JrUotFg6eBDJYWEuism3nF55yH4hSwrFncQMii/qYto6ggWS6AQZOL87c
   wbIt5ZTXWWlpnsck2Se0ex7z/VeAxAj+YHVDHMu4wDBpNPxR4U9JSj51D
   lkglDZOJw270ZG5wJL937hcjAk9F7v+kC9KPf5cK2kWJ+TXCuYkVha+Za
   AhGvNsVQM2qFI23pyRwUG93HBv43sw/Pw/vdOR/WH0udJEZMDaU/T0eSk
   RsaL1zZDdumLvcSrCORXVF6r8Ner63HKTw+CjLBc9JoSAvJI4UCyoklCA
   A==;
X-CSE-ConnectionGUID: yaC3RH3ORiK/6ygc9nzAHg==
X-CSE-MsgGUID: BnR47nJkSjqUg+we8W8dHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="55684895"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="55684895"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 12:29:25 -0800
X-CSE-ConnectionGUID: wf8QXQXOTPGTBIZKrbo7DQ==
X-CSE-MsgGUID: ungxZJx6RtusIcmWEiOdtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="130222520"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 30 Nov 2024 12:29:25 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHU5i-0000xl-1z;
	Sat, 30 Nov 2024 20:29:22 +0000
Date: Sun, 1 Dec 2024 04:28:35 +0800
From: kernel test robot <lkp@intel.com>
To: Pali =?unknown-8bit?B?Um9ow6Fy?= <pali@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pali:cifs 6/20] fs/smb/client/reparse.c:907:45: sparse: sparse:
 incorrect type in argument 4 (different base types)
Message-ID: <202412010441.v34pfCXa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pali/linux.git cifs
head:   f36b8c5bb788de2feea99660389db8e290cb36c5
commit: 811d283b82113b5c52ed723a5565c365a713f054 [6/20] cifs: Add support for parsing WSL-style symlinks
config: x86_64-randconfig-122-20241117 (https://download.01.org/0day-ci/archive/20241201/202412010441.v34pfCXa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412010441.v34pfCXa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412010441.v34pfCXa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/smb/client/reparse.c:145:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got int @@
   fs/smb/client/reparse.c:145:25: sparse:     expected restricted __le16 [usertype]
   fs/smb/client/reparse.c:145:25: sparse:     got int
   fs/smb/client/reparse.c:146:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got int @@
   fs/smb/client/reparse.c:146:35: sparse:     expected restricted __le16 [usertype]
   fs/smb/client/reparse.c:146:35: sparse:     got int
   fs/smb/client/reparse.c:147:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got int @@
   fs/smb/client/reparse.c:147:25: sparse:     expected restricted __le16 [usertype]
   fs/smb/client/reparse.c:147:25: sparse:     got int
>> fs/smb/client/reparse.c:907:45: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned short [usertype] *pwcs @@     got restricted __le16 [usertype] *[assigned] symname_utf16 @@
   fs/smb/client/reparse.c:907:45: sparse:     expected unsigned short [usertype] *pwcs
   fs/smb/client/reparse.c:907:45: sparse:     got restricted __le16 [usertype] *[assigned] symname_utf16
   fs/smb/client/reparse.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false

vim +907 fs/smb/client/reparse.c

   877	
   878	static int parse_reparse_wsl_symlink(struct reparse_wsl_symlink_data_buffer *buf,
   879					     struct cifs_sb_info *cifs_sb,
   880					     struct cifs_open_info_data *data)
   881	{
   882		int len = le16_to_cpu(buf->ReparseDataLength);
   883		int symname_utf8_len;
   884		__le16 *symname_utf16;
   885		int symname_utf16_len;
   886	
   887		if (len <= sizeof(buf->Flags)) {
   888			cifs_dbg(VFS, "srv returned malformed wsl symlink buffer\n");
   889			return -EIO;
   890		}
   891	
   892		/* PathBuffer is in UTF-8 but without trailing null-term byte */
   893		symname_utf8_len = len - sizeof(buf->Flags);
   894		/*
   895		 * Check that buffer does not contain null byte
   896		 * because Linux cannot process symlink with null byte.
   897		 */
   898		if (strnlen(buf->PathBuffer, symname_utf8_len) != symname_utf8_len) {
   899			cifs_dbg(VFS, "srv returned null byte in wsl symlink target location\n");
   900			return -EIO;
   901		}
   902		symname_utf16 = kzalloc(symname_utf8_len * 2, GFP_KERNEL);
   903		if (!symname_utf16)
   904			return -ENOMEM;
   905		symname_utf16_len = utf8s_to_utf16s(buf->PathBuffer, symname_utf8_len,
   906						    UTF16_LITTLE_ENDIAN,
 > 907						    symname_utf16, symname_utf8_len * 2);
   908		if (symname_utf16_len < 0) {
   909			kfree(symname_utf16);
   910			return symname_utf16_len;
   911		}
   912		symname_utf16_len *= 2; /* utf8s_to_utf16s() returns number of u16 items, not byte length */
   913	
   914		data->symlink_target = cifs_strndup_from_utf16((u8 *)symname_utf16,
   915							       symname_utf16_len, true,
   916							       cifs_sb->local_nls);
   917		kfree(symname_utf16);
   918		if (!data->symlink_target)
   919			return -ENOMEM;
   920	
   921		return 0;
   922	}
   923	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
