Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3370F2576
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 02:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753152177; cv=none; b=UFZYn5YMDJdg3voNWPwmw3zD5KnCkENyixZv5JqAPCM05cF8dprJHwnSCa1Gde9vtOR6/GJ4iGfeGbPtopKhEnePprR+HstPi7VuvMXDUeAduE/8ZTNQ4OCiKdlQuNswjEq9Xs0UMNajte0ZZpy226AxUskVqeC4b5wu89kjfkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753152177; c=relaxed/simple;
	bh=P/4TdZzBqDtyh6a05qwX1g3SmQwiiAQxyiza93f7nQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PLCDuwtlEP/Vh9m3U0bU1wmWyiDOkcXmSPuMXXzTijfsmf6TQ7SGC2+LUkAujOdLqKdvRjEQt53AZ9OSkZQIPcyoSAszDpqku6/6Qm70s2jsbeCxB8gwbj5VL+8lc/vu2ElNwT4XkiUWAQdkpDY3ypNOT/PakrCTiqZbVU8LGRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bcpV5EWK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bcpV5EWK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753152175; x=1784688175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P/4TdZzBqDtyh6a05qwX1g3SmQwiiAQxyiza93f7nQs=;
  b=bcpV5EWKq0ory5RgyDG+yMgDZHD83kWD76XNOZLSaaEFO1pAtgXohwvK
   3dgUycEqY90irSBKBukqfoFBjGVrJAgqgScSpDNpvDggsoVtJoJHVlWm7
   AoBAYrpn4MXk/Bm+LxKUIqbj+rYmof/Y2/6dK6Ebgw8kwQ7n7Lo37FL7r
   TumzqdLaesT2PlJIHlSQyE4dlzzsvu3Vj/cJODe/addhlIdruYzkAPSGn
   7d7N4shEtpwwunrgyTxL9Rt50L+uK0RSSAAeF8byU5R+TUtEdIaws7iHr
   tQHGnsoxeLduP+EQTNctJzytHjBzNNytZ1Ghc5bPUk7GoXXvCGziWeO3k
   A==;
X-CSE-ConnectionGUID: 07+QXG7mRWKc07fJIhYPHw==
X-CSE-MsgGUID: akxD4qrSQOiYR6ZDOCblew==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="54600922"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="54600922"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 19:42:55 -0700
X-CSE-ConnectionGUID: vqREAZnRTW2o9bajJRb3og==
X-CSE-MsgGUID: 8RGxadM7QSKWZCdbXwLhVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="158665042"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Jul 2025 19:42:53 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ue2xv-000HMb-1c;
	Tue, 22 Jul 2025 02:42:51 +0000
Date: Tue, 22 Jul 2025 10:42:00 +0800
From: kernel test robot <lkp@intel.com>
To: Shuming Fan <shumingf@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [linux-next:master 3351/11398] sound/soc/sdca/sdca_hid.c:27:15:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202507221024.M18hWD6q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   97987520025658f30bb787a99ffbd9bbff9ffc9d
commit: ac558015dfd803626622bd0ba9645d58a3ed16b1 [3351/11398] ASoC: SDCA: add a HID device for HIDE entity
config: i386-randconfig-061-20250722 (https://download.01.org/0day-ci/archive/20250722/202507221024.M18hWD6q-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507221024.M18hWD6q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507221024.M18hWD6q-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/sdca/sdca_hid.c:27:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int rsize @@     got restricted __le16 [usertype] wDescriptorLength @@
   sound/soc/sdca/sdca_hid.c:27:15: sparse:     expected unsigned int rsize
   sound/soc/sdca/sdca_hid.c:27:15: sparse:     got restricted __le16 [usertype] wDescriptorLength

vim +27 sound/soc/sdca/sdca_hid.c

    20	
    21	static int sdwhid_parse(struct hid_device *hid)
    22	{
    23		struct sdca_entity *entity = hid->driver_data;
    24		unsigned int rsize;
    25		int ret;
    26	
  > 27		rsize = entity->hide.hid_desc.rpt_desc.wDescriptorLength;
    28	
    29		if (!rsize || rsize > HID_MAX_DESCRIPTOR_SIZE) {
    30			dev_err(&hid->dev, "invalid size of report descriptor (%u)\n", rsize);
    31			return -EINVAL;
    32		}
    33	
    34		ret = hid_parse_report(hid, entity->hide.hid_report_desc, rsize);
    35	
    36		if (!ret)
    37			return 0;
    38	
    39		dev_err(&hid->dev, "parsing report descriptor failed\n");
    40		return ret;
    41	}
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
