Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC9C33D0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 May 2024 22:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716589058; cv=none; b=IFF3Yafs+ZQw2IeD284qwdNQ4k8+QSwqL9vu3Fs8gRuWFjBqvZojOc47OxpVfRCSF1NTx78WnX2msiNe384B5kh/MdhF4Z3i1fmB7HSiIDftDeITZB2rjedhvm0eRTr4RUqpXqRzOrSvTYq388+LliJK68tmjTan1A8O3jpk9XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716589058; c=relaxed/simple;
	bh=M9EArhODLrmkGtQBy/pHxWq4JteMIdZO33MT7+dNYYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p62Nidz4eTlJ/BURARyBrmTtIVc9nmFrf9NMMyQQ/BEJOzm7/cOwBW7lK/885+XG1ksIBTSpVx1bQIxYZx3Inph8hzvtPiQApEbzXoWxOJ263fMEWSMifZz+zg+jLmL3nc74f2Wu5RY7yt1wwcoC/gBOi/UgXS0Aa3zXPVFZXjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=egPoI8j6; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="egPoI8j6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716589057; x=1748125057;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M9EArhODLrmkGtQBy/pHxWq4JteMIdZO33MT7+dNYYo=;
  b=egPoI8j68C92kvra9TjaZV3uHvk/vTJwDiSqK3zSuF5YkZrjNdSGpv/C
   rJlXcsrsW3ddfNUEasNT2bgMbiso4lEEp7yyGqG5/ZeYuV4c176kDJkJc
   Q4zBVekzBm3BaSjXiWNZkq6DmBrbSVQk8VYESaZgTZHV+thTcOj44+juw
   oZkUA/2VNJtHidCt/fOaJVrNg8zrYv3ZEslycFetOftDALekiqx4fA0RR
   UsZ+/e31QFrIvY8G2Q6Uz5bBE2XkyKGP1EaCsC8kJtn74zkEYskvQEA9G
   4AAwcn6E+pIee7V6wE9v4Vs13dXh0Tyk+OYbvXKes2U9taIIq8A4nelqo
   A==;
X-CSE-ConnectionGUID: BwUC0dkUThmILPKAbfgQSg==
X-CSE-MsgGUID: J+2urtQ5TVmqtRGE85fqqw==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="13209457"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="13209457"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 15:17:36 -0700
X-CSE-ConnectionGUID: 5lZWG2J3QcmScsKt8SZI3w==
X-CSE-MsgGUID: MDqR4ITkTKSYoJ8aWSNLAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="34254867"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 24 May 2024 15:17:34 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAdE9-0005xi-0K;
	Fri, 24 May 2024 22:17:30 +0000
Date: Sat, 25 May 2024 06:17:20 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Hauer <s.hauer@pengutronix.de>, linux-wireless@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	Kalle Valo <kvalo@kernel.org>, David Lin <yu-hao.lin@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] wifi: mwifiex: fix parsing of more than two AKM suites
Message-ID: <202405250631.g417GL0g-lkp@intel.com>
References: <20240523081428.2852276-1-s.hauer@pengutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240523081428.2852276-1-s.hauer@pengutronix.de>

Hi Sascha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v6.9 next-20240523]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sascha-Hauer/wifi-mwifiex-fix-parsing-of-more-than-two-AKM-suites/20240523-161947
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20240523081428.2852276-1-s.hauer%40pengutronix.de
patch subject: [PATCH] wifi: mwifiex: fix parsing of more than two AKM suites
config: x86_64-randconfig-122-20240525 (https://download.01.org/0day-ci/archive/20240525/202405250631.g417GL0g-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405250631.g417GL0g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405250631.g417GL0g-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/marvell/mwifiex/uap_cmd.c:54:17: sparse: sparse: cast to restricted __le16
   drivers/net/wireless/marvell/mwifiex/uap_cmd.c:72:17: sparse: sparse: cast to restricted __le16

vim +54 drivers/net/wireless/marvell/mwifiex/uap_cmd.c

    27	
    28	static void woal_check_rsn_ie(const struct IEEEtypes_Rsn_t *rsn_ie, int len,
    29				      struct mwifiex_uap_bss_param *bss_config, u8 *pairwise_cipher)
    30	{
    31		int left, count, i;
    32		struct wpa_suite_ucast *key_mgmt;
    33	
    34		left = len;
    35		if (left < (int)sizeof(struct IEEEtypes_Rsn_t))
    36			return;
    37	
    38		bss_config->wpa_cfg.group_cipher = 0;
    39		*pairwise_cipher = 0;
    40		bss_config->key_mgmt = 0;
    41	
    42		/* check the group cipher */
    43		switch (be32_to_cpu(rsn_ie->group_cipher)) {
    44		case WLAN_CIPHER_SUITE_TKIP:
    45			bss_config->wpa_cfg.group_cipher = CIPHER_TKIP;
    46			break;
    47		case WLAN_CIPHER_SUITE_CCMP:
    48			bss_config->wpa_cfg.group_cipher = CIPHER_AES_CCMP;
    49			break;
    50		default:
    51			break;
    52		}
    53	
  > 54		count = le16_to_cpu(rsn_ie->pairwise_cipher.count);
    55		for (i = 0; i < count; i++) {
    56			switch (be32_to_cpu(rsn_ie->pairwise_cipher.suite[i])) {
    57			case WLAN_CIPHER_SUITE_TKIP:
    58				*pairwise_cipher |= CIPHER_TKIP;
    59				break;
    60			case WLAN_CIPHER_SUITE_CCMP:
    61				*pairwise_cipher |= CIPHER_AES_CCMP;
    62				break;
    63			default:
    64				break;
    65			}
    66		}
    67		left -= sizeof(struct IEEEtypes_Rsn_t) + (count - 1) * sizeof(__be32);
    68		if (left < (int)sizeof(struct wpa_suite_ucast))
    69			return;
    70	
    71		key_mgmt = ((void *)rsn_ie + sizeof(struct IEEEtypes_Rsn_t) + (count - 1) * sizeof(__be32));
    72		count = le16_to_cpu(key_mgmt->count);
    73		if (left < (int)(sizeof(struct wpa_suite_ucast) +
    74				 (count - 1) * sizeof(__be32)))
    75			return;
    76	
    77		for (i = 0; i < count; i++) {
    78			switch (be32_to_cpu(key_mgmt->suite[i])) {
    79			case WLAN_AKM_SUITE_8021X:
    80				bss_config->key_mgmt |= KEY_MGMT_EAP;
    81				break;
    82			case WLAN_AKM_SUITE_PSK:
    83				bss_config->key_mgmt |= KEY_MGMT_PSK;
    84				break;
    85			case WLAN_AKM_SUITE_PSK_SHA256:
    86				bss_config->key_mgmt |= KEY_MGMT_PSK_SHA256;
    87				break;
    88			case WLAN_AKM_SUITE_SAE:
    89				bss_config->key_mgmt |= KEY_MGMT_SAE;
    90				break;
    91			case WLAN_AKM_SUITE_OWE:
    92				bss_config->key_mgmt |= KEY_MGMT_OWE;
    93				break;
    94			}
    95		}
    96	}
    97	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
