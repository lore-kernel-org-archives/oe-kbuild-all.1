Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F412561AE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Feb 2026 05:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770873012; cv=none; b=eTv3WyqreiBrlsEp9xLYWc59pmALk3pVe+vRN7ohOCWlFVl3pG03fmPNC/tX92PSCunTEu0QUK3J0NWd9nyTOg89jhK2z+WG3jlMEtONfG87MCAn8ct96hDiM0RHWIyjGS4wH7L3MmqG8EL/idUvDCqBy2ly5OuDWwAF9+2UpQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770873012; c=relaxed/simple;
	bh=AWycgvjXareZiKDi2v1YKnUJ7irl/9M9MIsERyYFAzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XNedAEgXOccWGr5ZGL4Z/dViE5tr8DcoG45T4FA28cThsptPuQ0gXio8DJd1GC225x2CxUS8+Zv8F8hqP4b0607M/A6bDEN6+gAK0m38b6spE1tozmAwnzSF0SMCZMCl5LClbGSYdKHGYAa3Sbde9BnUQPzaFGCcFMggSd5qTZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B77+QzK9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B77+QzK9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770873010; x=1802409010;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AWycgvjXareZiKDi2v1YKnUJ7irl/9M9MIsERyYFAzk=;
  b=B77+QzK9O91aTbENuZYvZ0jUdJEzKiBHhBPo0qox40RlB0/Wck54WI9R
   /baYLGKjknkgXjLA915/gL3aOy4Yia/UH6aYL4MFGjDdPsU8qEA2IlRLu
   SS/tAtfU7E6qKIZcCJSSTsq3sjZW8kV0nqX+m2aeHLAHmNh8ij+8lw0da
   thialL2TgIjPWpOohkS/LoiOH8HYByuKFR/wa3/BI+nkJuzPMFIuZvOrz
   YxprSWYsV7TNagJV++pKHTJ4b4UkF10MYVzObw5gvPc4mqFhiOWDEnj2k
   TQjzJMt0wo1/nZefzLd3DRWOEA6MKO0qyzWMOCqMO2oybCJ+33pesiTHj
   w==;
X-CSE-ConnectionGUID: LUsb1E4xR+WAC5KGLsNqew==
X-CSE-MsgGUID: W1SBR5X7TqyqGAiOT81UnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71944123"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="71944123"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 21:10:10 -0800
X-CSE-ConnectionGUID: 1tIveEPuR0GxAVMIvq/eOw==
X-CSE-MsgGUID: NlORbNgpSoKdtcMi6ae+UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="250146124"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Feb 2026 21:10:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqOxn-00000000qiu-1qg3;
	Thu, 12 Feb 2026 05:10:03 +0000
Date: Thu, 12 Feb 2026 13:09:28 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Kyle Tso <kyletso@google.com>, RD Babiera <rdbabiera@google.com>,
	Amit Sunil Dhamne <amitsd@google.com>
Subject: Re: [PATCH 2/2] usb: typec: tcpm: add support for Sink Cap Extended
 msg response
Message-ID: <202602121335.mBTMe5lG-lkp@intel.com>
References: <20260211-skedb-v1-2-616340426cdc@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211-skedb-v1-2-616340426cdc@google.com>

Hi Amit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8dfce8991b95d8625d0a1d2896e42f93b9d7f68d]

url:    https://github.com/intel-lab-lkp/linux/commits/Amit-Sunil-Dhamne-via-B4-Relay/dt-bindings-connector-Add-sink-properties-to-comply-with-PD-3-1-spec/20260212-072745
base:   8dfce8991b95d8625d0a1d2896e42f93b9d7f68d
patch link:    https://lore.kernel.org/r/20260211-skedb-v1-2-616340426cdc%40google.com
patch subject: [PATCH 2/2] usb: typec: tcpm: add support for Sink Cap Extended msg response
config: arc-randconfig-002-20260212 (https://download.01.org/0day-ci/archive/20260212/202602121335.mBTMe5lG-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602121335.mBTMe5lG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602121335.mBTMe5lG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/usb/typec/tcpm/tcpm.c:351 cannot understand function prototype: 'struct pd_identifier'
>> Warning: drivers/usb/typec/tcpm/tcpm.c:368 cannot understand function prototype: 'struct sink_caps_ext_data'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
