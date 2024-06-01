Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB38625
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Jun 2024 04:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717216629; cv=none; b=da4Yl57Ik4Nua6hwVn9G5hq4RPdC6pHsT91ZuL+Zyn5Vg3UaOLnzm1dPl4bce9FybRpk5Vx5rOJ3DNyo8ZqbHLaGf8NuZGxVy0u1KEX8M8raLgKPgqJfhhecuoSJj1vx1ohMB5XOmEB+sR7zSiplQfmqc0ZhJkGcHaO1OgAjyoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717216629; c=relaxed/simple;
	bh=lt5ZqEftyeeUaFEuCNBZBXICzm2A55RGqKSTJoN59VY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hp1mK43i1R8wt+4b5U+r6By880vJsZ771K7Z83XeTclD8BC3cB6YL5jYTsMhVYdAfrwW9gMQ93MvaN+yPupCW31UkRX2svXPyqEmpWp87Hqrj7E2L6L8VdqTPPyagMN2l/+R8ErKFojgZcwekAhIY1GoS0wqvd8UnHv9ft8VuOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EzYxBp+B; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EzYxBp+B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717216627; x=1748752627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lt5ZqEftyeeUaFEuCNBZBXICzm2A55RGqKSTJoN59VY=;
  b=EzYxBp+BR4v1V9IdoEbQr4WjwjX8QscwI+zSGxLUQgMucUnoF1FTSK9U
   liuuCHrqNqlDimlrh7EvzFdfIPkCdAGNEdHCQirutXeYKWGFvYHUcZ3sF
   iieXocDSKGY7ZtEWx7vtiUAUQdYPi4iNil+LuHcrkw5kLPxC+uCB5HkAE
   C3URJkwjifdxDOTqkLaFmFJZJULO9bxFr2ETqDu06OOWKjyzlkTpTXskD
   wAMAcNeyk0sZsttA6jaSHNV0p3qXCl1ivIjt/fG+PVrY/hh4bQUP3oBC6
   n+oHHUlCgh1bc9i4FRobhLjIF0gRvDLCQyPfhV14GhTCkhbRsYFzDYa3G
   g==;
X-CSE-ConnectionGUID: Z9Q1ipA5QUewQPuijqaGtg==
X-CSE-MsgGUID: w2lEyECKRNWlFB255lzt5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="17619924"
X-IronPort-AV: E=Sophos;i="6.08,206,1712646000"; 
   d="scan'208";a="17619924"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 21:37:06 -0700
X-CSE-ConnectionGUID: 1L9YSeNzR7irtB/dQ8vZcA==
X-CSE-MsgGUID: UVaxd5QvSJawEug8ih0RoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,206,1712646000"; 
   d="scan'208";a="36443970"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 31 May 2024 21:37:05 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDGUJ-000IP3-0v;
	Sat, 01 Jun 2024 04:37:03 +0000
Date: Sat, 1 Jun 2024 12:36:52 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/sdca-interrupt-handler 21/21]
 sound/soc/codecs/rt712-sdca.c:1188:37: warning: variable 'interrupt_info'
 set but not used
Message-ID: <202406011229.kls8NBcR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/sdca-interrupt-handler
head:   cf1ef35b990554f35693db73eae7f6b461af107e
commit: cf1ef35b990554f35693db73eae7f6b461af107e [21/21] ASoC: rt712-sdca: use generic SDCA interrupt handler
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240601/202406011229.kls8NBcR-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406011229.kls8NBcR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406011229.kls8NBcR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/rt712-sdca.c: In function 'jack_detection_callback':
>> sound/soc/codecs/rt712-sdca.c:1188:37: warning: variable 'interrupt_info' set but not used [-Wunused-but-set-variable]
    1188 |         struct sdca_interrupt_info *interrupt_info;
         |                                     ^~~~~~~~~~~~~~
   sound/soc/codecs/rt712-sdca.c: In function 'button_detection_callback':
   sound/soc/codecs/rt712-sdca.c:1206:37: warning: variable 'interrupt_info' set but not used [-Wunused-but-set-variable]
    1206 |         struct sdca_interrupt_info *interrupt_info;
         |                                     ^~~~~~~~~~~~~~


vim +/interrupt_info +1188 sound/soc/codecs/rt712-sdca.c

  1182	
  1183	/* this is called with the irqs_lock mutex held */
  1184	static void jack_detection_callback(void *context)
  1185	{
  1186		struct rt712_sdca_priv *rt712 = context;
  1187		struct sdw_slave *slave = rt712->slave;
> 1188		struct sdca_interrupt_info *interrupt_info;
  1189	
  1190		interrupt_info = slave->sdca_data.interrupt_info;
  1191		rt712->scp_sdca_stat1 = SDW_SCP_SDCA_INT_SDCA_0;
  1192	
  1193		/*
  1194		 * Invoke the delayed work unconditionally, the test on
  1195		 * the SDCA_0 being enabled was done in the common handler
  1196		 */
  1197		mod_delayed_work(system_power_efficient_wq,
  1198				 &rt712->jack_detect_work, msecs_to_jiffies(30));
  1199	}
  1200	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
