Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EEF1FCF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 08:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="enuPPFTc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696927657; x=1728463657;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=ymKPyXX+MMt0rsb9c5uaVXqZCv5g6sfDzydyxvk28dg=;
  b=enuPPFTcAxwyOa2Z1HziCSXnuMF3wNvzJEW5yf1WeVb0M0fSFPBVrYs8
   QABQTurM+NlmvnSXe6AvYs/SZZCWhw9hyw719KKXPHk31ObQeHbkjXOVr
   3ZEFB4wY5tuOpTEJkon2u7rA/10XXzjt3SWpB/yG3/b6kx0I1TqFJKsc9
   7q3aqr9TUBsDdblld0gTqzRk7NiB7013hdVIXZNQQ0w9DnLRya1YMqSze
   jYNMHly6tHIsKtU3aXfJhAxTt6cBk1ePYY3NfrI93OSyWTuP63dXl0nlL
   MTTq9jPpunF9d4A4kXApF4pN/DWS2RHMM7bKIHJmpcHROpcB35loMio8a
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="387179405"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="387179405"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 01:47:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="788506097"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="788506097"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 10 Oct 2023 01:47:35 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qq8Op-0000Cy-0s;
	Tue, 10 Oct 2023 08:47:31 +0000
Date: Tue, 10 Oct 2023 16:47:21 +0800
From: kernel test robot <lkp@intel.com>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] i2c: stm32f7: Fix PEC handling in case of SMBUS
 transfers
Message-ID: <ZSUPmZI4T8E8a/JF@7e1dc97a21a5>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010084455.1718830-1-alain.volmat@foss.st.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2] i2c: stm32f7: Fix PEC handling in case of SMBUS transfers
Link: https://lore.kernel.org/stable/20231010084455.1718830-1-alain.volmat%40foss.st.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



