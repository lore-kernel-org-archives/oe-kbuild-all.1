Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA2E39F17B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 11:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772711937; cv=none; b=Alv0jjWhM+e2N2VGnU1yxfjs0Ni3cWX015aB3zZBCNExpZSBTJ/HDJD9wWeCSAB6UxjonnX29aqKP+0YCk2Quox6CEgCN2H1EsJzWMUuRzTrxBE5x/KW+XpT+VuTeMXCXYsJZ0jXa+BNCQ9C8zq0P8Oz24atcSY87qGJHsviGak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772711937; c=relaxed/simple;
	bh=H5ycddqtrh31SXCsDvGuI6Hm39G4XTxP2PilMdmvGW0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YfSzWs7Xch5eoRukcuewUVWTN2Ql71AQhPxPoWnvQ0YVgdoh7xCc/oTsSq4tiARfdgICmSm0g9Azqa+05tV3w8mmBFb1Ud8/0iL7GNo1DkqPDLqdE7CL6CLx7+ATjHOK8vkaRg6LLe6398wMZuLztilzbJzJOUJznwAVv+2ueEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WMh+Fupy; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WMh+Fupy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772711934; x=1804247934;
  h=date:from:to:cc:subject:message-id;
  bh=H5ycddqtrh31SXCsDvGuI6Hm39G4XTxP2PilMdmvGW0=;
  b=WMh+FupyASwYTY1/rqt5MR18fi9OrcMeQ6CSdJJdrtA4sLf9B8QI3noF
   QsYQ3DE46P0PvgfR6f9KRtB3xz9clfCDWD6CaXu+4iN9FT+GgcewDUbmo
   m96Z4nAnvv2Y4hWBpotU2Yv09UR5VyoSaL/YKtVFH9xaZQYq0/hToo3X5
   wq2ke/CrlB9PwT6+c3n9uA568/87dUhF5iKu3Eqo3g3JJblCJrTgEWyFO
   sR7ihNrM5F4kjzUquOI8QZXBH/oFrlqtDNcBUzUbYMCrm7ODFsZdqlAW7
   iCf35aRE60OJ2fKBPy43+pOxNAjLK+MitzFBKcu/ASrEdSgtlpdnt4Hm6
   Q==;
X-CSE-ConnectionGUID: jy+8yX00QbewxuClwRnrPg==
X-CSE-MsgGUID: C08MArRoSquZAihZmOtObQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="84429976"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; 
   d="scan'208";a="84429976"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 03:58:53 -0800
X-CSE-ConnectionGUID: 2KKHQ7DiRVCabfjAG2Mnxg==
X-CSE-MsgGUID: EYCWltr3TN668fUaxb4LyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; 
   d="scan'208";a="215475901"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Mar 2026 03:58:52 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy7Lt-000000000Yw-3EVO;
	Thu, 05 Mar 2026 11:58:49 +0000
Date: Thu, 05 Mar 2026 19:58:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-5.15.y 410/410]
 drivers/i3c/master.c:2203:3: warning: variable 'i2cdev' is uninitialized when
 used here
Message-ID: <202603051906.4EKAKFkl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common upstream-linux-5.15.y
head:   91d48252ad4b17577cf8cc8d3e1353402e4da8f1
commit: acbd89719cb195143b5fc610c82e18f887631eaf [410/410] i3c: remove i2c board info from i2c_dev_desc
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260305/202603051906.4EKAKFkl-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051906.4EKAKFkl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603051906.4EKAKFkl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i3c/master.c:2203:3: warning: variable 'i2cdev' is uninitialized when used here [-Wuninitialized]
    2203 |                 i2cdev->dev = i2c_new_client_device(adap, &i2cboardinfo->base);
         |                 ^~~~~~
   drivers/i3c/master.c:2181:29: note: initialize the variable 'i2cdev' to silence this warning
    2181 |         struct i2c_dev_desc *i2cdev;
         |                                    ^
         |                                     = NULL
   1 warning generated.


vim +/i2cdev +2203 drivers/i3c/master.c

  2177	
  2178	static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
  2179	{
  2180		struct i2c_adapter *adap = i3c_master_to_i2c_adapter(master);
  2181		struct i2c_dev_desc *i2cdev;
  2182		struct i2c_dev_boardinfo *i2cboardinfo;
  2183		int ret;
  2184	
  2185		adap->dev.parent = master->dev.parent;
  2186		adap->owner = master->dev.parent->driver->owner;
  2187		adap->algo = &i3c_master_i2c_algo;
  2188		strncpy(adap->name, dev_name(master->dev.parent), sizeof(adap->name));
  2189	
  2190		/* FIXME: Should we allow i3c masters to override these values? */
  2191		adap->timeout = 1000;
  2192		adap->retries = 3;
  2193	
  2194		ret = i2c_add_adapter(adap);
  2195		if (ret)
  2196			return ret;
  2197	
  2198		/*
  2199		 * We silently ignore failures here. The bus should keep working
  2200		 * correctly even if one or more i2c devices are not registered.
  2201		 */
  2202		list_for_each_entry(i2cboardinfo, &master->boardinfo.i2c, node)
> 2203			i2cdev->dev = i2c_new_client_device(adap, &i2cboardinfo->base);
  2204	
  2205		return 0;
  2206	}
  2207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
