Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569EB378
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jun 2023 01:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687568846; x=1719104846;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P6wZk7MF4SlFUpTpCcuRbEr7K9Mso347QOjbT+IxNlc=;
  b=d8/XEVzumf7pJxX5p1n8vjE0XbcLzyPaF2QbhPLCpzN6oDQ5QCZ2chZR
   9lC09DOnvPgeGeADvRqPbjfV3lLLFfngoQILmZ8ow/lQrXcWW1W68DEEu
   v3nxFvLNR3ofAVx5/O8O3KbFmRAZaQWcIkSY6bjKRsEgoyJfxvpO/aO7O
   XDtGUt585rp1wUZd96y/A4PRATLE4z/ixKlmXjmV/Vb44+H6iAvVUcErx
   DWqNOo3DZtzEU3K138SBl7S/x5YENMkP7MmaNO76LnbZZpki/m4Kcbmta
   HU6Ezo4BlHHJ4ou7b1KExR7YjHzp2gfEWBSmxPjczZ/3u68BVkdmyHGff
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="390970071"
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; 
   d="scan'208";a="390970071"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 18:07:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="805378537"
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; 
   d="scan'208";a="805378537"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Jun 2023 18:07:22 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCrkH-0008cn-2g;
	Sat, 24 Jun 2023 01:07:21 +0000
Date: Sat, 24 Jun 2023 09:06:30 +0800
From: kernel test robot <lkp@intel.com>
To: Komal Bajaj <quic_kbajaj@quicinc.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Komal Bajaj <quic_kbajaj@quicinc.com>
Subject: Re: [PATCH v4 3/6] nvmem: sec-qfprom: Add Qualcomm secure QFPROM
 support.
Message-ID: <202306240837.Keyvmt2I-lkp@intel.com>
References: <20230623141806.13388-4-quic_kbajaj@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230623141806.13388-4-quic_kbajaj@quicinc.com>

Hi Komal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.4-rc7 next-20230623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Komal-Bajaj/dt-bindings-nvmem-sec-qfprom-Add-bindings-for-secure-qfprom/20230623-222054
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230623141806.13388-4-quic_kbajaj%40quicinc.com
patch subject: [PATCH v4 3/6] nvmem: sec-qfprom: Add Qualcomm secure QFPROM support.
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230624/202306240837.Keyvmt2I-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230624/202306240837.Keyvmt2I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306240837.Keyvmt2I-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvmem/sec-qfprom.c:31: warning: expecting prototype for struct sec_sec_qfprom_priv. Prototype was for struct sec_qfprom_priv instead


vim +31 drivers/nvmem/sec-qfprom.c

    20	
    21	
    22	/**
    23	 * struct sec_sec_qfprom_priv - structure holding secure qfprom attributes
    24	 *
    25	 * @qfpseccorrected: iomapped memory space for secure qfprom corrected address space.
    26	 * @dev: qfprom device structure.
    27	 */
    28	struct sec_qfprom_priv {
    29		phys_addr_t qfpseccorrected;
    30		struct device *dev;
  > 31	};
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
