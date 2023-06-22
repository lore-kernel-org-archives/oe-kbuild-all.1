Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5081F182
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 18:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687458589; x=1718994589;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=sAMtdJGFOrPNGvo+P+jzCmggQReY0RKjVQsxVZA/FRM=;
  b=fQo8Kmf7QUMJe4xoay5uUWkngl+bTsZUC9CPJmG916IqYyEGJJedKqfO
   QDJkTM4KOMLNDbJotGOjEzkDfASZfh0DCmEiM5nZ/GF8VJuuf4y+w1zA2
   1k9x37K/LxnoetyblVXUEHT6DTxHqO7jMJSK1s/Gg4lvUccdvLWNtFe+H
   NFWF/8zJ1cJJH0fJMYN7dBF0hknlx8jcQHU8+ninYB91Z21/2tC/WnxAQ
   2CSFS3NSQi3NsRjB0ZpuCTudPBggey0kiP+yZjI4/RxbV/2c6arrJW/8r
   6RXtG7diie0xwNr4ZqIScmP/yfqSInZbf2k3NndnSXcqJc2Z5qte/sEGO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="359438452"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="359438452"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 11:29:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="785026514"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="785026514"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 Jun 2023 11:29:46 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCP3x-0007jv-14;
	Thu, 22 Jun 2023 18:29:45 +0000
Date: Fri, 23 Jun 2023 02:29:12 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/3] drm/i915/gt: Drop read from GEN8_L3CNTLREG in ICL
 workaround
Message-ID: <ZJSS+Ca2GSIazO9T@65525e8f8615>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622182731.3765039-3-lucas.demarchi@intel.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH 3/3] drm/i915/gt: Drop read from GEN8_L3CNTLREG in ICL workaround
Link: https://lore.kernel.org/stable/20230622182731.3765039-3-lucas.demarchi%40intel.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



