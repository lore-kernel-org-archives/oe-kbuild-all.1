Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC783E2768
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 16:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281330; cv=none; b=bBBvso+zYwcrEG9GJI+5oMGqhpPNwYEZAaNOeA2lruS/rJVxfjQCWqs5fCa00XasRfPUtI17W/LIRtG/8JAZN4fopkG3gnQ0LBGUz8OzHDZVg2CBw0Em6maV9MbkNjQXEzT64o2cOUxuZRi9vA9Hlfz0KQXV9xhRe0iHsVOyOi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281330; c=relaxed/simple;
	bh=RbQZgYPbfmQklJdytyRcTSoJXgDPK4GcP8PULnfUOqY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pqdf0gBMcYxKVlFY43nqukkdcI8x2CNiUvAoRBvOZaAyLXsWKKgCaSy0aa29bj2K3GLRvB5l3dT6tdqS+IXKiwNp8csQh6mjLJDDUSh+WSvZL+15Ki3URRnHOdLicwzW6t2/dN+NAbYPEgClKvLmvYVtt0koQWKqIlSEKVsO2iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kGEXaSWc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kGEXaSWc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781281324; x=1812817324;
  h=date:from:to:cc:subject:message-id;
  bh=RbQZgYPbfmQklJdytyRcTSoJXgDPK4GcP8PULnfUOqY=;
  b=kGEXaSWcYHTPhdgejBdhBduIK0fJEM9eQpK093I+8bOoxqNInZh5JDIQ
   3pSbGxRDexYu1cot1+8DWpYZnoFB0uMIo5QG0jp6r0X8xESlOWjH4Kd9X
   zEweA21ugfpa3uuncdvJp0Aju/sFGK8cSk7wjgx1K7DFw3odbIZ/+PwYF
   UWoGgukohfUM4D4mpq7pi4mK0UAGLCBzz748UjFgTtOsNLjMLVw9tYOG8
   m72Gsuh/wIhXvGU87Hf9QHXZPfmY9vpt/vZ73eeUfSTWYfCC4vlbHq+hv
   /LA4c0+DOCnLjpyeFhzNjkb0gC24R4IIJYgvGTbJsw9mNHWzA4Z8KQ/HF
   A==;
X-CSE-ConnectionGUID: HJ4k1ThcQtGUbH8000HOpg==
X-CSE-MsgGUID: T6Q8PQLLSFC9mKyv4bXB8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="99533140"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="99533140"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 09:22:03 -0700
X-CSE-ConnectionGUID: VT+MFaYgSVKP997CQSzJNA==
X-CSE-MsgGUID: 47CPZqpvQSyJEVnRS1Nh4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="251798265"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Jun 2026 09:22:01 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY4dq-00000000P2b-3uVZ;
	Fri, 12 Jun 2026 16:21:58 +0000
Date: Sat, 13 Jun 2026 00:21:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Lars-Peter Clausen" <lars@metafoo.de>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <noname.nuno@gmail.com>
Subject: [nsa:xlnx/fix/buf-mmap-multibuffer 10106/27391]
 drivers/iio/frequency/ad9523.c:794:12: warning: 'ad9523_calc_dividers'
 defined but not used
Message-ID: <202606130040.XuIuKbN5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/nunojsa/linux xlnx/fix/buf-mmap-multibuffer
head:   a26a8baba71e866951f6abf4fc6c0504770c272e
commit: 6f1a46d9904170212d62f6c4ffa7c483d2a513d1 [10106/27391] iio: ad9523-1: Add support for computing PLL2 dividers
config: x86_64-randconfig-016-20260612 (https://download.01.org/0day-ci/archive/20260613/202606130040.XuIuKbN5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606130040.XuIuKbN5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606130040.XuIuKbN5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:11,
                    from include/linux/list.h:8,
                    from include/linux/kobject.h:20,
                    from include/linux/device.h:17,
                    from drivers/iio/frequency/ad9523.c:9:
   include/linux/log2.h:22:1: warning: ignoring attribute 'noreturn' because it conflicts with attribute 'const' [-Wattributes]
      22 | int ____ilog2_NaN(void);
         | ^~~
>> drivers/iio/frequency/ad9523.c:794:12: warning: 'ad9523_calc_dividers' defined but not used [-Wunused-function]
     794 | static int ad9523_calc_dividers(unsigned int vcxo_freq, unsigned int m1_freq,
         |            ^~~~~~~~~~~~~~~~~~~~


vim +/ad9523_calc_dividers +794 drivers/iio/frequency/ad9523.c

   793	
 > 794	static int ad9523_calc_dividers(unsigned int vcxo_freq, unsigned int m1_freq,
   795		unsigned int m2_freq, struct ad9523_platform_data *pdata)
   796	{
   797		unsigned long n2[2], r2[2];
   798		unsigned int fpfd;
   799		unsigned int m_freq, vco_freq;
   800		unsigned int m, m1, m2;
   801	
   802		m1_freq /= 1000;
   803		m2_freq /= 1000;
   804		vcxo_freq /= 1000;
   805	
   806		if (m1_freq != 0)
   807			m_freq = m1_freq;
   808		else
   809			m_freq = m2_freq;
   810	
   811		for (m = 3; m <= 5; m++) {
   812			vco_freq = m_freq * m;
   813			if (AD9523_VCO_FREQ_MIN <= vco_freq &&
   814			    AD9523_VCO_FREQ_MAX >= vco_freq)
   815				break;
   816		}
   817	
   818		if (m == 6)
   819			return -EINVAL;
   820	
   821		if (m1_freq != 0) {
   822			m1 = m;
   823			if (m2_freq != 0) {
   824				m2 = vco_freq / m2_freq;
   825				if (m2 < 3 || m2 > 5 || vco_freq % m2_freq > 1)
   826					return -EINVAL;
   827			} else {
   828				m2 = 3;
   829			}
   830		} else {
   831			m1 = 3;
   832			m2 = m;
   833		}
   834	
   835		rational_best_approximation(vco_freq, vcxo_freq, 255, 31,
   836			&n2[0], &r2[0]);
   837	
   838		pdata->pll2_freq_doubler_en = false;
   839	
   840		if (vco_freq != vcxo_freq * n2[0] / r2[0]) {
   841			rational_best_approximation(vco_freq, vcxo_freq*2, 255, 31,
   842				&n2[1], &r2[1]);
   843	
   844			if (abs((int)(vco_freq / n2[0]) - (int)(vcxo_freq / r2[0])) >
   845			    abs((int)(vco_freq / n2[1] / 2) - (int)(vcxo_freq / r2[1]))) {
   846				n2[0] = n2[1];
   847				r2[0] = r2[1];
   848				pdata->pll2_freq_doubler_en = true;
   849			}
   850		}
   851	
   852		fpfd = vcxo_freq * (pdata->pll2_freq_doubler_en ? 2 : 1) / r2[0];
   853	
   854		while (fpfd > 259000 || !ad9523_pll2_valid_div(n2[0])) {
   855			fpfd /= 2;
   856			n2[0] *= 2;
   857			r2[0] *= 2;
   858		}
   859	
   860		pdata->pll2_r2_div = r2[0];
   861		pdata->pll2_vco_div_m1 = m1;
   862		pdata->pll2_vco_div_m2 = m2;
   863		pdata->pll2_ndiv_a_cnt = n2[0] % 4;
   864		pdata->pll2_ndiv_b_cnt = n2[0] / 4;
   865	
   866		return 0;
   867	}
   868	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
