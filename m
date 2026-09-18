Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233B94F7CC2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 14:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743443; cv=none; b=pIo+qHvTmXLeoHvjfW4RM5c/JqSzn+x9ctXU01LkwbIkxn3p/wcXzbyFZeTnkmxC5JIpr4gpVNJk89USTwHh9MqBm29kBdHTjDSvgqJ3p5YOJEEfUAswD8r0n6XRrdnsTm32xQFACvGf7s5e2A6MFUYKOymjl7CDoSiOi+ch2mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743443; c=relaxed/simple;
	bh=uo8enhPihzaiJlTJf/Fsx2OTZLGt2BgW64+Kkw6ufio=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F8bihFm6n7obpAdtu3XAQvPrrUIMWi0MIJVHFOJ33Hg0LS7rZWUoqp6h+BmtzVw8LuMEIOE+Reby29sNiIFJfGoxCVX27DnEXrHbWwW4827S6uBwML6mcBZXTsfuBrdN0LeTFxeTF8pQ9U3ov46lQJtOLHvXVeN4Vc6zlN3Y5yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DjV8/mRr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DjV8/mRr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789743441; x=1821279441;
  h=date:from:to:cc:subject:message-id;
  bh=uo8enhPihzaiJlTJf/Fsx2OTZLGt2BgW64+Kkw6ufio=;
  b=DjV8/mRrnuswhvfUXyB/kzsDZqgYbStr5iTKedQtlSVJGQ8FiyggWAXS
   WRci3glxt+N+bclsmhF42ONz+eqRqGIxj0vCQqu1oDY7KbiopC5PCDfHm
   U68ULjVASHq44A4sm1lWWbsLaQgQGy/2O+2Ztz3cArNyyjYqFmXQhgpva
   FLc36v2rTjaA8vidoRqwHmn9mluw7dAOW4blO8P9gi5I9H0S8eE0+E+VB
   kebbgw6feyZpkWZVxbs/SwwcIfKwToIHjv6I5v8JzZw4GQ3wzSZeh+NsD
   80/KNyfn+MXrCYsnp8rW8qTB5WCGvjFL32Hq/YC4rXC49UB4Y6xRruy7s
   g==;
X-CSE-ConnectionGUID: Y3sGzjPBQzuPdTtdu81sIg==
X-CSE-MsgGUID: UpbPLpzNT22mEwLYIo4U6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="115786853"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="115786853"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 07:57:20 -0700
X-CSE-ConnectionGUID: Z7cU45V/Rq+Gd7QwKwglDQ==
X-CSE-MsgGUID: FQSQjjjtSQGKQMz4rbhy5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2871901"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 18 Sep 2026 07:57:20 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7a1Z-0000000017a-1ryo;
	Fri, 18 Sep 2026 14:57:13 +0000
Date: Fri, 18 Sep 2026 16:56:36 +0200
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-09-16-2 326/326]
 sound/soc/codecs/tas2781-i2c.c:1175 tasdevice_get_capture_profile_id() warn:
 inconsistent indenting
Message-ID: <202609181637.V7jmi295-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-09-16-2
head:   658065d115f821c89744349f6080f3af6739e453
commit: 3c7279edf3e9a8ab8da22c9b6f7964d1b75aea3e [326/326] dai
config: riscv-randconfig-r2200-20260918 (https://download.01.org/0day-ci/archive/20260918/202609181637.V7jmi295-lkp@intel.com/config)
compiler: clang version 21.1.6 (https://github.com/llvm/llvm-project a832a5222e489298337fbb5876f8dcaf072c5cca)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609181637.V7jmi295-lkp@intel.com/

smatch warnings:
sound/soc/codecs/tas2781-i2c.c:1175 tasdevice_get_capture_profile_id() warn: inconsistent indenting

vim +1175 sound/soc/codecs/tas2781-i2c.c

  1156	
  1157	/**
  1158	 * tasdevice_get_capture_profile_id - Report current active capture profile
  1159	 * ID to user space
  1160	 * @kcontrol: ALSA kcontrol structure passed from ALSA core
  1161	 * @ucontrol: User-space control element value buffer to write the result back
  1162	 *
  1163	 * This function ensures the returned profile ID is always clamped inside the
  1164	 * valid range advertised by the info callback, preventing accidental invalid
  1165	 * values from being exposed to applications even if internal driver state is
  1166	 * temporarily inconsistent.
  1167	 *
  1168	 * Returns 0 on successful fill of the control value, no error conditions
  1169	 * are defined for this getter callback.
  1170	 */
  1171	static int tasdevice_get_capture_profile_id(struct snd_kcontrol *kcontrol,
  1172				struct snd_ctl_elem_value *ucontrol)
  1173	{
  1174		struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
> 1175			struct device *dev = snd_soc_component_to_dev(codec);
  1176		struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
  1177		unsigned int max_valid_id, current_prof_id;
  1178	
  1179		max_valid_id = tas_priv->rcabin.ncfgs > 0 ?
  1180			(tas_priv->rcabin.ncfgs - 1U) : 0;
  1181	
  1182		/*
  1183		 * Cast current profile id to unsigned to match type with max_valid_id,
  1184		 * avoid signedness mismatch;
  1185		 */
  1186		current_prof_id = (unsigned int)tas_priv->rcabin.capture_profile_id;
  1187		/* Prevent underflow when there are no loaded capture profiles. */
  1188		ucontrol->value.integer.value[0] = min(current_prof_id, max_valid_id);
  1189	
  1190		return 0;
  1191	}
  1192	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
