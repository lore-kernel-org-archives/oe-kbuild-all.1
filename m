Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9BA10941
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jul 2023 17:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688407161; x=1719943161;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=0KQh8hPclyt8Tpuaarfnp7DVoSBirK/DCKhrf3brP8s=;
  b=dhCXoFwlLu1B4qF3peOCBGV76qADlaPpN5bKr63GLjfnsFIwZTlO4Fgw
   9ITRZqUGF+D7DnzNgiayloOQlJ4ycvKV3/H70CiW7KBgofChmGN2nm1tX
   gH+QW20sGZaV9WMcoX1ve1tzKpizTIY2PzAGL92ZfnwwTG59wUt41lm3q
   2I/6Wn8jkuti/rC6LDrv+UqTAuDHSrDA7kxQsfIgwii0kBs41HaSDwQor
   MB2a2T0gj3U6wWvQZeaXOadnAqOe4kDYraVYQOT81mJFAO8w0qknmK+9v
   bUbmdVXNurbheJ2rxt2A8wzsCPrSilda8jyaSR1a80SVlfUPwPkZ9nm2y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="343271022"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="343271022"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 10:59:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="695877320"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="695877320"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 Jul 2023 10:59:19 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGNpW-000HYj-11;
	Mon, 03 Jul 2023 17:59:18 +0000
Date: Tue, 4 Jul 2023 01:58:35 +0800
From: kernel test robot <lkp@intel.com>
To: Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V2] PCI: qcom: Use PARF_SLV_ADDR_SPACE_SIZE for ops_2_3_3
Message-ID: <ZKMMSz3zJvoSsLnp@65525e8f8615>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230703175757.2425540-1-quic_srichara@quicinc.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH V2] PCI: qcom: Use PARF_SLV_ADDR_SPACE_SIZE for ops_2_3_3
Link: https://lore.kernel.org/stable/20230703175757.2425540-1-quic_srichara%40quicinc.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



