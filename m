Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55306F2F2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 02:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766285456; cv=none; b=V1cXhIAHXZPe9DDFHNyZpQxciBT4KamTx59mZDqTbDC/n4tekcPbn8LEq4lUDEbDpjK3Eo6J1465xN4pf1SiUY2E0Zgy+sMlRsitpnLunpxJsq1QRIMFZMAAgOLf2IPg/oL/qMTzmVXSQuNlqSQrBJrsu93qYWUVPUEfHtlkJ5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766285456; c=relaxed/simple;
	bh=tFXfoDR/9nQzEzybV0uNBrFAoeT0vB/Or74w7ESDUR0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oXWcX/Ii6eBfe7iWPCGqnfwl+WONZrnRv3H67urEEwGWT6CmRvssQi9Gqx3hRyqMUN5VHLR8yUZCyQjVsgjjcYqNH4f9zmXH5wc+vqv52NRGA+w1GkVgJMP5+Cce3Uaq6rP+n9oG8ij1JsK6WVWgncVgWVySlaGC83736yjlmSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gz8TNr/A; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gz8TNr/A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766285454; x=1797821454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tFXfoDR/9nQzEzybV0uNBrFAoeT0vB/Or74w7ESDUR0=;
  b=gz8TNr/AtnrCqTxO4Ioo94jhvw08BlBqAL6ESBiN8v1WQM4Ma6lPDG9a
   EOfpED8lrX0eH2bTci+zTFMMHR/0z64tXXd/CQGSk893t/U2e2BBGeie6
   qBmt9e5iExj7mgwR0XwffpgZMadEEPADG7o5Pi9Es0sFabsset8ZDZKZI
   rcxDQ434+BArBvz3D0YnGgfu2MPdpfm7gzhII+VqnHrbeftZwKnPjV7kP
   XIOSGW5HSNTyOoGeeZ+bGo2RLQPjqPXZIpZ8hNdeV39ebBj9Tw/61ntGo
   o2Gh/GwvD7cBq28Ke63bqEDvc/gdQou5vsGcjtbIUtnk0glAXf+hL98uG
   Q==;
X-CSE-ConnectionGUID: LoKEK0ZYTYK4PUe6QKONWw==
X-CSE-MsgGUID: 22LQLYjMRnqEi0/aYuw5XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="85776942"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="85776942"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 18:50:54 -0800
X-CSE-ConnectionGUID: w1Z+fKvXTLWjYzfdEb0iVQ==
X-CSE-MsgGUID: AMK3u0xHQrK7ulNHsEObVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199117238"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 20 Dec 2025 18:50:53 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX9X1-000000004ui-1WPn;
	Sun, 21 Dec 2025 02:50:51 +0000
Date: Sun, 21 Dec 2025 03:49:51 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for CRYPTO_ENGINE when selected by
 GKI_HIDDEN_CRYPTO_CONFIGS
Message-ID: <202512210318.TCPM1jid-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   2141da9e498139ac37a520b62dfdc77db8003146
commit: 77002c324012cf3931a613f828b37abe7ab4392a [12/12] ANDROID: gki_defconfig: Enable req modules in GKI
config: x86_64-kismet-CONFIG_CRYPTO_ENGINE-CONFIG_GKI_HIDDEN_CRYPTO_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251221/202512210318.TCPM1jid-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512210318.TCPM1jid-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210318.TCPM1jid-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_ENGINE when selected by GKI_HIDDEN_CRYPTO_CONFIGS
   WARNING: unmet direct dependencies detected for CRYPTO_ENGINE
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - GKI_HIDDEN_CRYPTO_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
