Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEF415B0F9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 04:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727412483; cv=none; b=k80x/FuRIL59e8vpK9ICkehExyHF6wxRm0GV/sOlO9cXH2c394MrpfjoaFumqn210WTKXQJIEkMKQApJwzjHHVB4FX3MlDtmsoVxK2KBjrMTNqUzFEp1yA6cPgFhJ871T+D72IRY5LM+wxp15VEK7xcmPnR+dqDSbIxbi6Jrg8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727412483; c=relaxed/simple;
	bh=qC2jhxg7WlhX38LeC4pPC2pcLt1WwpSHbyeFL2HNUh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RzeG9SVxtSu1y4PXrrt87Jnt6ramWfr3OTP7oaIjfydTqAJNAne0IkSOpNPCkBzr4wK/MXOE+vB7x8NoFrHZcJXmrpIPYMbJRVRV1W/oj8Crm6EOFqa3TM14YsHrZ5yUZTjSkoi4V1LGqp5U9TXb4FZSC/H1KvteDzDKNKh1TQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T5j+JNNZ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T5j+JNNZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727412481; x=1758948481;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qC2jhxg7WlhX38LeC4pPC2pcLt1WwpSHbyeFL2HNUh8=;
  b=T5j+JNNZ/x+qR0B0SkwNJz1QhfabVxHHUPt+q3uMQBHA9k2P/eDS3O06
   sWnOE0Jiv/2LUdscgj4JWAryuih8K/WDVGqVghNsppG069dVoDvVfXE8f
   bXzmebKRfyj+9FDiMEkRjVIquPJu3Fgr2XPy+axPeyMuo9VrEA8SKpwT5
   Ij0Hl5oRzip/aT/39vsCKDpkvKv4EOjdrs7WJaO+UqhxMEBWUy4LBD97H
   HaUbwAsjxPSo7Mjkm/KSoGA7u1/+DkhW4XKXfRsuKMYrANWH1JBSRI/OT
   9yiIlqfEOEwsBLzsTUR9qQ9TADVq7KF1f0pwaEM3zTxS3vNpUlzHEzY8y
   A==;
X-CSE-ConnectionGUID: oPhBQ/NmQhmNL4NGNhDWfg==
X-CSE-MsgGUID: DwFUnBNDTUiGZsotpopxvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="44061803"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="44061803"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 21:47:59 -0700
X-CSE-ConnectionGUID: /WCBYUQMSe+w08i1SKRseg==
X-CSE-MsgGUID: fltToOK8R0Chkgi5CP16PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="76464027"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Sep 2024 21:47:56 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su2tV-000LUH-2C;
	Fri, 27 Sep 2024 04:47:53 +0000
Date: Fri, 27 Sep 2024 12:47:09 +0800
From: kernel test robot <lkp@intel.com>
To: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>, patrick@stwcx.xyz,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Carsten =?iso-8859-1?Q?Spie=DF?= <mail@carsten-spiess.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Yikai Tsai <yikai.tsai.wiwynn@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v7 2/2] hwmon: (isl28022) new driver for ISL28022 power
 monitor
Message-ID: <202409271235.PtMXq9Kx-lkp@intel.com>
References: <20240925031131.14645-3-yikai.tsai.wiwynn@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925031131.14645-3-yikai.tsai.wiwynn@gmail.com>

Hi Yikai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.11 next-20240926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yikai-Tsai/dt-bindings-hwmon-add-renesas-isl28022/20240925-111332
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20240925031131.14645-3-yikai.tsai.wiwynn%40gmail.com
patch subject: [PATCH v7 2/2] hwmon: (isl28022) new driver for ISL28022 power monitor
config: i386-randconfig-r133-20240927 (https://download.01.org/0day-ci/archive/20240927/202409271235.PtMXq9Kx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271235.PtMXq9Kx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271235.PtMXq9Kx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwmon/isl28022.c:396:36: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int err @@     got char * @@
   drivers/hwmon/isl28022.c:396:36: sparse:     expected int err
   drivers/hwmon/isl28022.c:396:36: sparse:     got char *
>> drivers/hwmon/isl28022.c:396:88: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected char const *fmt @@     got unsigned int [addressable] [assigned] [usertype] val @@
   drivers/hwmon/isl28022.c:396:88: sparse:     expected char const *fmt
   drivers/hwmon/isl28022.c:396:88: sparse:     got unsigned int [addressable] [assigned] [usertype] val
   drivers/hwmon/isl28022.c:406:36: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int err @@     got char * @@
   drivers/hwmon/isl28022.c:406:36: sparse:     expected int err
   drivers/hwmon/isl28022.c:406:36: sparse:     got char *
   drivers/hwmon/isl28022.c:406:82: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected char const *fmt @@     got unsigned int [addressable] [assigned] [usertype] val @@
   drivers/hwmon/isl28022.c:406:82: sparse:     expected char const *fmt
   drivers/hwmon/isl28022.c:406:82: sparse:     got unsigned int [addressable] [assigned] [usertype] val
   drivers/hwmon/isl28022.c:414:28: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int err @@     got char * @@
   drivers/hwmon/isl28022.c:414:28: sparse:     expected int err
   drivers/hwmon/isl28022.c:414:28: sparse:     got char *
>> drivers/hwmon/isl28022.c:414:87: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected char const *fmt @@     got unsigned int [usertype] shunt @@
   drivers/hwmon/isl28022.c:414:87: sparse:     expected char const *fmt
   drivers/hwmon/isl28022.c:414:87: sparse:     got unsigned int [usertype] shunt
   drivers/hwmon/isl28022.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false

vim +396 drivers/hwmon/isl28022.c

   346	
   347	/*
   348	 * read property values and make consistency checks.
   349	 *
   350	 * following values for shunt range and resistor are allowed:
   351	 *   40 mV -> gain 1, shunt min.  800 micro ohms
   352	 *   80 mV -> gain 2, shunt min. 1600 micro ohms
   353	 *  160 mV -> gain 4, shunt min. 3200 micro ohms
   354	 *  320 mV -> gain 8, shunt min. 6400 micro ohms
   355	 */
   356	static int isl28022_read_properties(struct device *dev, struct isl28022_data *data)
   357	{
   358		u32 val;
   359		int err;
   360	
   361		err = device_property_read_u32(dev, "shunt-resistor-micro-ohms", &val);
   362		if (err == -EINVAL)
   363			val = 10000;
   364		else if (err < 0)
   365			return err;
   366		data->shunt = val;
   367	
   368		err = device_property_read_u32(dev, "renesas,shunt-range-microvolt", &val);
   369		if (err == -EINVAL)
   370			val = 320000;
   371		else if (err < 0)
   372			return err;
   373	
   374		switch (val) {
   375		case 40000:
   376			data->gain = 1;
   377			if (data->shunt < 800)
   378				goto shunt_invalid;
   379			break;
   380		case 80000:
   381			data->gain = 2;
   382			if (data->shunt < 1600)
   383				goto shunt_invalid;
   384			break;
   385		case 160000:
   386			data->gain = 4;
   387			if (data->shunt < 3200)
   388				goto shunt_invalid;
   389			break;
   390		case 320000:
   391			data->gain = 8;
   392			if (data->shunt < 6400)
   393				goto shunt_invalid;
   394			break;
   395		default:
 > 396			dev_err_probe(dev, "renesas,shunt-range-microvolt invalid value %d\n", val);
   397			return -EINVAL;
   398		}
   399	
   400		err = device_property_read_u32(dev, "renesas,average-samples", &val);
   401		if (err == -EINVAL)
   402			val = 1;
   403		else if (err < 0)
   404			return err;
   405		if (val > 128 || hweight32(val) != 1) {
 > 406			dev_err_probe(dev, "renesas,average-samples invalid value %d\n", val);
   407			return -EINVAL;
   408		}
   409		data->average = val;
   410	
   411		return 0;
   412	
   413	shunt_invalid:
 > 414		dev_err_probe(dev, "renesas,shunt-resistor-microvolt invalid value %d\n", data->shunt);
   415		return -EINVAL;
   416	}
   417	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
