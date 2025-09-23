Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6633FC8E6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 01:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758592101; cv=none; b=KOyjVPfbTgAVZESeHuiC9wEDMMMj7OG6tJvW9KGFj/YzoSKYNdSlyBLjnPWImzWPIpb6l4Y/Npid61go8Qp6JLH0sF2YTvzdt4kUVYIvvAGDUPfS+PEkjkmUgtH6bxku/RLYvl/G5HdlCCEoBqz1lqYtnhpm+H7unzNv2LLqmls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758592101; c=relaxed/simple;
	bh=otAtZyvxHTTYESxkOxGs3cfPOvE8jCbocnfeNR0ihXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hkJvEmOCp0xikRXuWXZKTQuqyIAukiyh+zSzWhYuPJ1IjJAHwjfW0j/P/jhgBHTms1tg2RntNqT0Eu1SmJmanDN0Iy91oa5QPNmsQ5HDMJ9BFv02TxIblXxa8iwAMPb0u6HW31JieG6aTtB149wUBjhAc0yvy7IQu1bV+eqXj30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=InXyCxAQ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="InXyCxAQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758592099; x=1790128099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=otAtZyvxHTTYESxkOxGs3cfPOvE8jCbocnfeNR0ihXk=;
  b=InXyCxAQpAi9iplLkZSqZWJy2/I4RJ0IkZMiV0h0AViABR5AlISBswvs
   CnWLaMWoDiwi25orYsNH98cXJ9keYl9J22PpluzlUu7w8apHOk/MQ1Xi7
   ZV4NzUYIeddFWQO6iNxR/DnWJZ+OxyNnbuwRtQ1gu7ddY2HNERatCK29m
   01uzvAwvNUqZjuN7IMRe2Nbionack2avKRQy0V33JmgDpEChMKYuUGz2F
   ar/dgNE9ZtjeZ6kwklHahPnsQcgczakfzh3HIOOU2IK2+4q7h3cyWEcBg
   gkUimYSbc/1zvrdgZNVvfnuWhknrIPvua0nUMHeiK4gznPLlhe/oZJ+SM
   Q==;
X-CSE-ConnectionGUID: g03oAe5STpOUqJ/zCwd2LA==
X-CSE-MsgGUID: VAMn1vj8Qxy4tlZEf2ksSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60981504"
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="60981504"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 18:48:19 -0700
X-CSE-ConnectionGUID: Ag51k8kqR+mW7g22imincA==
X-CSE-MsgGUID: AQl9JpXTS4a7y8Yq4mpDlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="175910985"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Sep 2025 18:48:18 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0s8d-0002dO-0K;
	Tue, 23 Sep 2025 01:48:15 +0000
Date: Tue, 23 Sep 2025 09:47:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 1/1]
 drivers/media/dvb-frontends/dib7000p.c:2203:2: warning: ISO C90 forbids
 mixed declarations and code
Message-ID: <202509230901.EG8UAags-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   c92395c2d69365e987de03603133963279b28a32
commit: 7a41ecfc3415ebe3b4c44f96b3337691dcf431a3 [1/1] media: dvb-frontends: w7090p: fix null-ptr-deref in w7090p_tuner_write_serpar and w7090p_tuner_read_serpar
config: arm-randconfig-002-20250923 (https://download.01.org/0day-ci/archive/20250923/202509230901.EG8UAags-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509230901.EG8UAags-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509230901.EG8UAags-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/dvb-frontends/dib7000p.c: In function 'w7090p_tuner_write_serpar':
>> drivers/media/dvb-frontends/dib7000p.c:2203:2: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     u16 serpar_num = msg[0].buf[0];
     ^~~
   drivers/media/dvb-frontends/dib7000p.c: In function 'w7090p_tuner_read_serpar':
   drivers/media/dvb-frontends/dib7000p.c:2224:2: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     u16 serpar_num = msg[0].buf[0];
     ^~~


vim +2203 drivers/media/dvb-frontends/dib7000p.c

713d54a8bd8122 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2195  
713d54a8bd8122 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2196  static int w7090p_tuner_write_serpar(struct i2c_adapter *i2c_adap, struct i2c_msg msg[], int num)
713d54a8bd8122 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2197  {
713d54a8bd8122 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2198  	struct dib7000p_state *state = i2c_get_adapdata(i2c_adap);
713d54a8bd8122 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2199  	u8 n_overflow = 1;
713d54a8bd8122 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2200  	u16 i = 1000;
7a41ecfc3415eb drivers/media/dvb-frontends/dib7000p.c Alex Guo              2025-06-15  2201  	if (msg[0].len < 3)
7a41ecfc3415eb drivers/media/dvb-frontends/dib7000p.c Alex Guo              2025-06-15  2202  		return -EOPNOTSUPP;
713d54a8bd8122 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04 @2203  	u16 serpar_num = msg[0].buf[0];
713d54a8bd8122 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2204  
713d54a8bd8122 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2205  	while (n_overflow == 1 && i) {
713d54a8bd8122 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2206  		n_overflow = (dib7000p_read_word(state, 1984) >> 1) & 0x1;
713d54a8bd8122 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2207  		i--;
713d54a8bd8122 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2208  		if (i == 0)
5a0e2a4e936d04 drivers/media/dvb-frontends/dib7000p.c Mauro Carvalho Chehab 2016-10-14  2209  			dprintk("Tuner ITF: write busy (overflow)\n");
713d54a8bd8122 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2210  	}
713d54a8bd8122 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2211  	dib7000p_write_word(state, 1985, (1 << 6) | (serpar_num & 0x3f));
713d54a8bd8122 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2212  	dib7000p_write_word(state, 1986, (msg[0].buf[1] << 8) | msg[0].buf[2]);
713d54a8bd8122 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2213  
713d54a8bd8122 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2214  	return num;
713d54a8bd8122 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2215  }
713d54a8bd8122 drivers/media/dvb/frontends/dib7000p.c Olivier Grenie        2011-01-04  2216  

:::::: The code at line 2203 was first introduced by commit
:::::: 713d54a8bd812229410a1902cd9b332a2a27af9f [media] DiB7090: add support for the dib7090 based

:::::: TO: Olivier Grenie <olivier.grenie@dibcom.fr>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
