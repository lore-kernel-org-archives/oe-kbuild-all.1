Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FB432B9A4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 15:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766677429; cv=none; b=mxNxu7jq6zA8TQdrIoIC1a5oLiDGzqqS+Aa7Rzq7FAKqfKraK7cC9vlbcw36iakvm1RJh6Fm48Xoinl88BDtKFYC0TYuIerx61m55IMkzUDkYP3P+pIEMi13fs7lDJlZvUh/cWaHEnT8jbpvHka/4LBUW8v6SjYvusUiIClQ6YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766677429; c=relaxed/simple;
	bh=q9WXpG+dgos7OvEH3xK50c87rlSECPltlxXkNNcQtEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s24GGWoBoQvRlC51YDm4NIVAp8f5hmvyO1lYsJFnRrs6CmfgKz9ngkPpFtq0NNhpU0Qx/8yqtUGwWkmXm7g3Fqp/c3+0+eump6o5NcgGKt1sJHnvKMoBlct0iFM0F3iAX9d4zn+/UCRGY/WZGsvFE3/KPH6EkbN6yRY9hlXWAUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ntIS8umt; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ntIS8umt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766677427; x=1798213427;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q9WXpG+dgos7OvEH3xK50c87rlSECPltlxXkNNcQtEY=;
  b=ntIS8umtSD9+hU1Fp6PshpPJq1APyIuhIZPPI1Zvjp0bd1SIEOOx9Sy/
   eN4ReLIsyU2adllOPtb9hPXmk5yaY93ARdtNTQUJut9Z7TlPMdab8DAIH
   zX1CRxxwV/imtyW374Pa597ooVIRN6EXk0WHA7vL7CmZmRJFAnh7FrL/H
   fHIRzguxacb+N1srIJ+XjW1Pq6WKEK8K+rzmQcm3QnYU141jFQS6j0kbh
   4y+JJOGTgk5jHtGMKqs3iIGe2V5SRnFULNIiWqFhYMsactAO+6XZ7B/9c
   qxBm8QWXQvT83K7fnrDNfLla8RG9qZjEsxxlpA2vWOZk6VfHpp91aC1V9
   A==;
X-CSE-ConnectionGUID: XTk0Ngj7QOqFpRu9ucvRYA==
X-CSE-MsgGUID: sPjeXODSR66mZOS+/EmgOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="79925520"
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="79925520"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 07:43:45 -0800
X-CSE-ConnectionGUID: nW5jaxgZRxmji24kW1ARpA==
X-CSE-MsgGUID: P7/WSTQRSoCtTyefOn1AnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="204736661"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 25 Dec 2025 07:43:44 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYnV7-000000004Cn-2zbH;
	Thu, 25 Dec 2025 15:43:41 +0000
Date: Thu, 25 Dec 2025 23:42:55 +0800
From: kernel test robot <lkp@intel.com>
To: Mahesh Talewad <mahesh.talewad@nxp.com>,
	linux-bluetooth@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, devyani.godbole@nxp.com,
	luiz.dentz@gmail.com, sarveshwar.bajaj@nxp.com,
	mahesh.talewad@nxp.com, vinit.mehta@nxp.com
Subject: Re: [PATCH BlueZ v2 1/1] Enhanced or Legacy Accept Synchronous
 Connection Request command
Message-ID: <202512252310.9FjpXrbM-lkp@intel.com>
References: <20251224063150.2476968-2-mahesh.talewad@nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224063150.2476968-2-mahesh.talewad@nxp.com>

Hi Mahesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.18]
[cannot apply to bluetooth-next/master bluetooth/master v6.19-rc2 v6.19-rc1 linus/master next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mahesh-Talewad/Enhanced-or-Legacy-Accept-Synchronous-Connection-Request-command/20251224-143311
base:   v6.18
patch link:    https://lore.kernel.org/r/20251224063150.2476968-2-mahesh.talewad%40nxp.com
patch subject: [PATCH BlueZ v2 1/1] Enhanced or Legacy Accept Synchronous Connection Request command
config: nios2-randconfig-r071-20251225 (https://download.01.org/0day-ci/archive/20251225/202512252310.9FjpXrbM-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512252310.9FjpXrbM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512252310.9FjpXrbM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/net/bluetooth/hci_core.h:37,
                    from net/bluetooth/hci_core.c:39:
>> include/net/bluetooth/hci_sync.h:198:33: warning: 'esco_params_msbc' defined but not used [-Wunused-const-variable=]
     198 | static const struct esco_params esco_params_msbc[] = {
         |                                 ^~~~~~~~~~~~~~~~


vim +/esco_params_msbc +198 include/net/bluetooth/hci_sync.h

   197	
 > 198	static const struct esco_params esco_params_msbc[] = {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
