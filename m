Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F6D18DB2F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 09:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741425433; cv=none; b=bNjM+lCM5k5nF9dWnuxaNWpit7WFbp4PDRszcle36bmQYnSLkDN7/ggN0mi12mS07GBBHlf5MhGd/r+r+PTApLtd1wpqyX3hZ9YpxFlDwyOoJ+NFjYwsyNe2VgQIKuk+c1jlA/WT5ZJsxAHD6XSvEM4wcgSth035j9LqQ9CrM8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741425433; c=relaxed/simple;
	bh=AmkJ7ad/5jBC0PhnRiqe9SrqTCaM7TojsMxvTR1Lfzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cVzz8r1wxhiT1ruxI7tHKE98dUv9aSAXzhiIqgrXtwNpt0HB82PycLl2MwXqo3v4eBZwnQ3/F1nYyUREuP8jllZZsSW9kcwMEJ7f+WjiUIkDvoZr7X0srS7O1IcdEhHghzfXRGFqywh+tKt94XhiwYUHvaChUMFS2NwPUb0Z7tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YA6si4qP; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YA6si4qP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741425431; x=1772961431;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AmkJ7ad/5jBC0PhnRiqe9SrqTCaM7TojsMxvTR1Lfzo=;
  b=YA6si4qPzArUtXJtlENSGMKaSwWx8st29wCQudQ9yxGZ2vv4Bw4lMuJD
   8mGEs5UQx7RDV0LU6IpBlK5vKJEPRVFIJATI8B6RoEW7AseBgcrTmee06
   719VXHb6uWMOU1jOpCyCaHTYo3mNmJGQiLjLsu3xcImc0ZhrJCEnsbBxD
   TI96GszFFJXFk8JU5xmtPGBumo4M82Fd9BJqWvq6D9N5ll10+Oslh481x
   gZzqyKxDxPYSwGbiDTw++Fug9o2ba8t6LSi5kJ1F5AiFxozFOV72M4zXS
   Vr27o44rWkl1RieOri33b9UFKob7WHNlBn1vkr6pKS4/RlGRD3Qe48a7U
   Q==;
X-CSE-ConnectionGUID: uBtvGixeSmCp7qAqn763lQ==
X-CSE-MsgGUID: uZL2J8BCTWSE3kS0kmscBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="46396067"
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="46396067"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 01:17:10 -0800
X-CSE-ConnectionGUID: fLV6IGZKT7mtqBEPsh0yXg==
X-CSE-MsgGUID: YbPWow3VRTmnJ5ZpKUccNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="124759205"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 08 Mar 2025 01:17:06 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqqIp-0001k0-2h;
	Sat, 08 Mar 2025 09:17:03 +0000
Date: Sat, 8 Mar 2025 17:16:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Reidel <adrian@mainlining.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Luca Weiss <luca.weiss@fairphone.com>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
	linux@mainlining.org, ~postmarketos/upstreaming@lists.sr.ht,
	Jens Reidel <adrian@mainlining.org>
Subject: Re: [PATCH v3 2/2] Input: goodix_berlin - Add support for Berlin-A
 series
Message-ID: <202503081606.xAchU9at-lkp@intel.com>
References: <20250307094823.478152-3-adrian@mainlining.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307094823.478152-3-adrian@mainlining.org>

Hi Jens,

kernel test robot noticed the following build errors:

[auto build test ERROR on dtor-input/next]
[also build test ERROR on dtor-input/for-linus robh/for-next krzk-dt/for-next linus/master v6.14-rc5 next-20250307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jens-Reidel/dt-bindings-input-goodix-gt9916-Document-gt9897-compatible/20250307-175154
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20250307094823.478152-3-adrian%40mainlining.org
patch subject: [PATCH v3 2/2] Input: goodix_berlin - Add support for Berlin-A series
config: i386-buildonly-randconfig-001-20250308 (https://download.01.org/0day-ci/archive/20250308/202503081606.xAchU9at-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503081606.xAchU9at-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081606.xAchU9at-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/input/touchscreen/goodix_berlin_i2c.c: In function 'goodix_berlin_i2c_probe':
>> drivers/input/touchscreen/goodix_berlin_i2c.c:35:36: error: 'cd' undeclared (first use in this function)
      35 |                 i2c_get_match_data(cd->dev);
         |                                    ^~
   drivers/input/touchscreen/goodix_berlin_i2c.c:35:36: note: each undeclared identifier is reported only once for each function it appears in


vim +/cd +35 drivers/input/touchscreen/goodix_berlin_i2c.c

    31	
    32	static int goodix_berlin_i2c_probe(struct i2c_client *client)
    33	{
    34		const struct goodix_berlin_ic_data *ic_data =
  > 35			i2c_get_match_data(cd->dev);
    36		struct regmap *regmap;
    37		int error;
    38	
    39		regmap = devm_regmap_init_i2c(client, &goodix_berlin_i2c_regmap_conf);
    40		if (IS_ERR(regmap))
    41			return PTR_ERR(regmap);
    42	
    43		error = goodix_berlin_probe(&client->dev, client->irq,
    44					    &goodix_berlin_i2c_input_id, regmap,
    45					    ic_data);
    46		if (error)
    47			return error;
    48	
    49		return 0;
    50	}
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
