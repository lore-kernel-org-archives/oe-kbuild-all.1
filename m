Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772541D2F72
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Aug 2024 19:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724786958; cv=none; b=U9H0jbBBdkFBKVzNU3oeKs0dtOjphjxMbDpmEXADhLCW9+h+yc8CTwtda8tgFszyxk2y92zayPm0OLtYFzoFemqYWiKwssNmOQuUMfz4fB3Xm7Xf96RFxGztPr6CDklHgnCGEpAWu38TbSlOmv94d49SBz4cKnvJeAXCLm45PFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724786958; c=relaxed/simple;
	bh=XmCKE1yAFFK3hqkryW2KkaSx2PKqUdv57bUBardyjb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWOFSWiMmZf4cVkrjAKdrB9R/kgcvfn1In8VDDBTwm9q8tX3Wkw9g6EECfPmugs0DSSgIY0V9vEpcZGn6j4Eqw4k8F5BRSW2ADqHW5rRQnIB/1llW1StQMXPjy0xfFKAQZD5G+IgHR0h4nG0VqJACT+b+7jWdV/K4x+MF/gRDKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YA3eVXYY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YA3eVXYY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724786957; x=1756322957;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XmCKE1yAFFK3hqkryW2KkaSx2PKqUdv57bUBardyjb8=;
  b=YA3eVXYYLrEMgdhGWK5Gzx6jkFJaa/mWPeyrOQhkHRN+6GJlpqZGtwGf
   v5mFv9pfolQ8SmxBVkdE8ZsJ3FFFx35tBMV7k/5sWRboCoALuJBo4Z9GR
   jFax+XXkxZsQyJQCpTGDq7A52N5tV8KLtyZToihhz/uOzTgzUNDw+b1Wo
   kznWVHJoRUKsyFEv0smblbOZcLSiiMB7t5eQ1XUjlUlF6lmi42YEH/pqE
   hXU2Ej7BW7161JuHHlEKHrEU9SawQHAU/HmE7qfxHPk8Tkq+4SzYnqzNa
   5g8OwkkGxFQhp/w4COa0ADFNjoF6xjdQlGbQp8EZPp0XU8yalDN7RJ/le
   A==;
X-CSE-ConnectionGUID: 9YKjcGhDQcO4u+BCH7jmkA==
X-CSE-MsgGUID: KaAGkEsAQP2F8c+gDI6hkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="33861377"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="33861377"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 12:29:14 -0700
X-CSE-ConnectionGUID: /9tq97SySTyv2uBoJnvGgw==
X-CSE-MsgGUID: rA87ujF4TZuIkwOehkX/Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="63283879"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Aug 2024 12:29:13 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sj1sL-000K0K-1w;
	Tue, 27 Aug 2024 19:29:09 +0000
Date: Wed, 28 Aug 2024 03:28:12 +0800
From: kernel test robot <lkp@intel.com>
To: Karol Kolacinski <karol.kolacinski@intel.com>,
	intel-wired-lan@lists.osuosl.org
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Karol Kolacinski <karol.kolacinski@intel.com>,
	anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com
Subject: Re: [Intel-wired-lan] [PATCH v8 iwl-next 2/7] ice: Remove
 unncecessary ice_is_e8xx() functions
Message-ID: <202408280349.0Wn5wfHn-lkp@intel.com>
References: <20240827130814.732181-11-karol.kolacinski@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827130814.732181-11-karol.kolacinski@intel.com>

Hi Karol,

kernel test robot noticed the following build errors:

[auto build test ERROR on 025f455f893c9f39ec392d7237d1de55d2d00101]

url:    https://github.com/intel-lab-lkp/linux/commits/Karol-Kolacinski/ice-Don-t-check-device-type-when-checking-GNSS-presence/20240827-211218
base:   025f455f893c9f39ec392d7237d1de55d2d00101
patch link:    https://lore.kernel.org/r/20240827130814.732181-11-karol.kolacinski%40intel.com
patch subject: [Intel-wired-lan] [PATCH v8 iwl-next 2/7] ice: Remove unncecessary ice_is_e8xx() functions
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240828/202408280349.0Wn5wfHn-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408280349.0Wn5wfHn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408280349.0Wn5wfHn-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/net/ethernet/intel/ice/ice_main.o: in function `ice_service_task':
>> ice_main.c:(.text+0x267ca): undefined reference to `ice_is_generic_mac'
   s390-linux-ld: drivers/net/ethernet/intel/ice/ice_controlq.o: in function `ice_is_sbq_supported':
>> ice_controlq.c:(.text+0x2fb6): undefined reference to `ice_is_generic_mac'
   s390-linux-ld: drivers/net/ethernet/intel/ice/ice_ptp.o: in function `ice_ptp_init':
>> ice_ptp.c:(.text+0xad28): undefined reference to `ice_is_e825c'
>> s390-linux-ld: ice_ptp.c:(.text+0xadde): undefined reference to `ice_is_e825c'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
