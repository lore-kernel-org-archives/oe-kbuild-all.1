Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C332815495
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Nov 2023 08:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L6jDhR2c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699952203; x=1731488203;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=cuH0q+GGLZ3B6Rh0qJaEswz6/JJE2ck7WoJVYXVBmXo=;
  b=L6jDhR2caUVJkKVPVvjx3/62l2zPcH9e/NBmAkqTiwNkuDlwd6RcioMl
   ICRN10D5GJm/W+ysOeHSzL9dO1+TtrJuhKjUig+kBqvqt+3k4zxFicrgI
   oAecV1xXqo4yUO9RePNbQ+ycNnZtqCi4QbQtFa0gI7SIadFP8kwvnOGYT
   3u4BmXeSk+CmdIWZs9HSfXIxPce06KNDrQ9mvfzGf8Py+Oi1aatKAIhXi
   w3Eic/JA0ZP442uKUjW87csxY26SHbyVya0Gf3Zx9WmN/3Xfa0WVZbEsu
   wQUgtdu7DfKoXuMTsXzGg3ZAIc3HueX2T38dH3g0a5recrIUnxyq6zubM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="393471578"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="393471578"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 00:56:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="799457967"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="799457967"
Received: from lkp-server02.sh.intel.com (HELO 83346ef18697) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 14 Nov 2023 00:56:42 -0800
Received: from kbuild by 83346ef18697 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2pDr-00008d-2e;
	Tue, 14 Nov 2023 08:56:39 +0000
Date: Tue, 14 Nov 2023 16:56:14 +0800
From: kernel test robot <lkp@intel.com>
To: Maria Yu <quic_aiquny@quicinc.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] pinctrl: avoid reload of p state in interation
Message-ID: <ZVM2LoL7I4vCyaWK@c06154b49574>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114085258.2378-1-quic_aiquny@quicinc.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] pinctrl: avoid reload of p state in interation
Link: https://lore.kernel.org/stable/20231114085258.2378-1-quic_aiquny%40quicinc.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



