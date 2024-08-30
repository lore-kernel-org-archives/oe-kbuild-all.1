Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E21571750
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Aug 2024 04:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724991593; cv=none; b=KYz7mti4LzmNuS78G/0lhMUYdH2cm4HFnwthmTkPKEq0VtQFA6J+tgR9hGM0pwvP2aEewin4k+pZcR5niQ3FOg9hhPFbFP8TbZDL5hi+PTY/2iB2l53jzqxVKz5pMcjC6NtOjfm9U/yuXICjGNCs31VgJupypj4NRD8tGlmxtI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724991593; c=relaxed/simple;
	bh=IRjEHiV/VXzrzeWTwk74CO6KPhW90RjCbn9FpQpNkoo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qdErlaKa4hfxvM8XjMf7ZkmbnCFxcyu71uQu57ue0KocUOZrX4y75FhnAyaIA6I3aIxBkMtj23lxyDAXe1yndiqspcYopkLIMtlQnbzm1jGOO/MDvbTX0tiFNLXUj0raRx7equTOybiw5fgbjlnD2pV+W6XlbSIRrZmf2GAQa8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CoUJ4afL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CoUJ4afL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724991592; x=1756527592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IRjEHiV/VXzrzeWTwk74CO6KPhW90RjCbn9FpQpNkoo=;
  b=CoUJ4afL4DGCa8YZLYuANvjtOtA3Qf6LSLgEi21qd24uyfoxqCSaUz0m
   il1Xk20Eu1f/6rX41NLX+c4iplB2rh2l07B8Bg4ClUCI9u3ewzMgsPa50
   pEpjU7d2A2y1TBzQiF3PbO2R8CuK52WjomR0Kk41H4IJ24ujYijW7r4ak
   5egg+3eKoLsQeh5G94XrF/Yc5YNxQMeRsy1BYI1uwjGuDQzXlVlYaIkYg
   tzvBhCm9FlI3r6T2d/pbVQbeX2QaWndLN51/Wzm63cKV27vgZkGh57Yc4
   fuig0FsK3Ss4zRj1AVjGXjP0YcAOhcCcFsOvjUwzrUt6lQsahIlZo9KSj
   g==;
X-CSE-ConnectionGUID: nUYs4qTcQ/utus9VA1Eonw==
X-CSE-MsgGUID: 7wn/qlbpQOywYu8wTPIV8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="35026567"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; 
   d="scan'208";a="35026567"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 21:19:52 -0700
X-CSE-ConnectionGUID: UXfccF5ARdGCUDb/zR/vlw==
X-CSE-MsgGUID: se+YXUx3Qd+mXhBh2+kGIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; 
   d="scan'208";a="63974422"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Aug 2024 21:19:50 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjt6y-000120-1G;
	Fri, 30 Aug 2024 04:19:48 +0000
Date: Fri, 30 Aug 2024 12:18:49 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, wu.zheng@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 5521/23944]
 drivers/bytedance/blackholefs/file.c:28:15: warning: variable 'fname' set
 but not used
Message-ID: <202408301228.Wi06EmX1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   114077d3641f55e0727e810a4f1277a658f703b7
commit: 658231c84c81b024c130b724cf9f12e5b018528d [5521/23944] bytedance: driver: blackholefs: Add blackholefs driver
config: x86_64-bytedance-5.15-velinux (https://download.01.org/0day-ci/archive/20240830/202408301228.Wi06EmX1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240830/202408301228.Wi06EmX1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408301228.Wi06EmX1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/bytedance/blackholefs/file.c: In function 'blackholefs_read':
>> drivers/bytedance/blackholefs/file.c:28:15: warning: variable 'fname' set but not used [-Wunused-but-set-variable]
      28 |         char *fname = "UNKNOWN";
         |               ^~~~~
   drivers/bytedance/blackholefs/file.c: In function 'blackholefs_write':
   drivers/bytedance/blackholefs/file.c:62:15: warning: variable 'fname' set but not used [-Wunused-but-set-variable]
      62 |         char *fname = "UNKNOWN";
         |               ^~~~~


vim +/fname +28 drivers/bytedance/blackholefs/file.c

    23	
    24	ssize_t blackholefs_read(struct file *f, char __user *ubuf, size_t s,
    25				loff_t *off)
    26	{
    27		loff_t read_size;
  > 28		char *fname = "UNKNOWN";
    29	
    30		TRACE();
    31		if (!f->f_inode) {
    32			ERROR();
    33			return 0;
    34		}
    35	
    36		if (f->f_path.dentry && f->f_path.dentry->d_name.name)
    37			fname = (char*)f->f_path.dentry->d_name.name;
    38	
    39		if (*off >= f->f_inode->i_size)
    40			return 0;
    41	
    42		DEBUG("[READ][%s] : f->f_pos = %lld, off = %lld, size = %ld, inode->i_size = %lld\n",
    43				fname, f->f_pos, *off, s, f->f_inode->i_size);
    44	
    45		if ((*off + s ) >= f->f_inode->i_size)
    46			read_size = f->f_inode->i_size - *off;
    47		else
    48			read_size = s;
    49	
    50		*off += read_size;
    51		if(clear_user(ubuf, s)) {
    52			ERROR();
    53		}
    54	
    55		return read_size;
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
