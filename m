Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB15E381B0A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 18:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462283; cv=none; b=TTAfO0KVY3RPcVL+ThxheWyUJdHGK9ToZ3f8w0VyS4fNFFajS2llccAbU97HzVuwOt1abhYKzsig9fYC9pHGuZ8wPsJ/3jYh7e6zApRYAc4lLCzLks/2tpAvoPiXLKxX1cSKWDSy5gWDJW3r/ht0kISwa29ar3b660fsVqgccxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462283; c=relaxed/simple;
	bh=UE/wyahaWInwR1TAAr1no7qqEXKDfMRyAEbbP587y48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGNNdevB5LkHnQtbn7dH4ORHiNeBdpSixPguD1tV5oW5DeZ2+CC5C2Q+11kqQkoZ5A7JTt7zBPUJSdumxdbkpcVQnNNpcX3jLrd0tPmvPvIDFva3KoRKQfUHMx95a3BGsGT0KK8Ja0kI4UEiBaZ4YruE37pmmjf/1HrM92GZKhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VZjqjLFP; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VZjqjLFP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774462282; x=1805998282;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UE/wyahaWInwR1TAAr1no7qqEXKDfMRyAEbbP587y48=;
  b=VZjqjLFPNmdUtbo+PfYEscKV5EWMnxYtN8VZ/yzV6InLFj2VlAuxBJSU
   7RjnailF+4aAp+dFZbD/iHyskvmaiP+wg4d41IaSvhkHtlUknxu9r8d2e
   KTw7Dj4nNjmTuwVI+2BrD1ezh6PDE51BpCTdFt8cQhM55awrQqbUZjrXO
   4u5enKgtCyCgr182XFH30BiVKi/lkUk8mhNjdDhXGDAWC9PatSl0v+bOR
   5GJWMxo0mOGWVhH4gDxVndIfmPP/DyLQjcIBPkANjydTQEjUVhApSpWSX
   nn39aBi9BY8VkneV781GW/ICU1eu69Wezepv8odd3AzUfoCOOG0TGYOmm
   w==;
X-CSE-ConnectionGUID: xHUuIceCS1esQ7Dqr2vRvw==
X-CSE-MsgGUID: 5BLmqnvjT4KKoypTHCTnww==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="93088548"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="93088548"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 11:11:21 -0700
X-CSE-ConnectionGUID: hWwmnzGuQk+vMVX0hZ8+VA==
X-CSE-MsgGUID: KjGFKeQTROGNi0M1zQv6iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="255253270"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Mar 2026 11:11:20 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5ShK-000000007SL-0VIu;
	Wed, 25 Mar 2026 18:11:18 +0000
Date: Thu, 26 Mar 2026 02:10:58 +0800
From: kernel test robot <lkp@intel.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
Message-ID: <202603260202.v7fmEK9E-lkp@intel.com>
References: <20260323125824.211615-3-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323125824.211615-3-loic.poulain@oss.qualcomm.com>

Hi Loic,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v7.0-rc5 next-20260324]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Loic-Poulain/dt-bindings-media-qcom-Add-CAMSS-Offline-Processing-Engine-OPE/20260323-220343
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260323125824.211615-3-loic.poulain%40oss.qualcomm.com
patch subject: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing Engine driver
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260326/202603260202.v7fmEK9E-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603260202.v7fmEK9E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603260202.v7fmEK9E-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

>> drivers/media/platform/qcom/camss/camss-ope.c:1478:35: warning: 'ope_ctrl_ops' defined but not used [-Wunused-const-variable=]
    1478 | static const struct v4l2_ctrl_ops ope_ctrl_ops = {
         |                                   ^~~~~~~~~~~~
--
>> ERROR: modpost: "__divdi3" [drivers/media/platform/qcom/camss/qcom-camss-ope.ko] undefined!
>> ERROR: modpost: "__udivdi3" [drivers/media/platform/qcom/camss/qcom-camss-ope.ko] undefined!


vim +/ope_ctrl_ops +1478 drivers/media/platform/qcom/camss/camss-ope.c

  1477	
> 1478	static const struct v4l2_ctrl_ops ope_ctrl_ops = {
  1479		.s_ctrl = ope_s_ctrl,
  1480	};
  1481	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
