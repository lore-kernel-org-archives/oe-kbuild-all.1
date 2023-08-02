Received: from mgamail.intel.com (unknown [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F123110C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Aug 2023 05:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690953315; x=1722489315;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fc2nysuFO9M8VGq9+Fl/1ckOPG9IPmlUO6abXeCqJyk=;
  b=U14ySm6xvFPHpwbZM0ApiNMgN4yIfdTfkRdetBtbv18Ved17TGoyl4kx
   vCykwe4Ie3EBk6uHQdnVxBfvExlb2B40GahdLr1FwqZs4slB958CWuYdp
   7KOA++6MpcxekT+xm8tmN+qnAH9OfLfE4QvLSsLwa4h9grK1v7wdimzsh
   Hjn7mr4berTzDXSRdkHyVZSyZzGJxXuvXqJzq7ssEBnuHOvVlCA+ZlRGN
   B7wb2rJpBdS+ZXma/oXUAgrl9TQC1VgnjHC5nDawg3APNWitMZTfJ1AlN
   2bkedCApUoReGY4+OGCHn4/j7yiEyGDnTi3UfDTTu23+8hy5nubkhHe6c
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="369480286"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="369480286"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 22:15:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="764064754"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="764064754"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 01 Aug 2023 22:15:09 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qR4CS-0000tB-2d;
	Wed, 02 Aug 2023 05:15:08 +0000
Date: Wed, 2 Aug 2023 13:14:44 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	manivannan.sadhasivam@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, helgaas@kernel.org,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
	quic_nitegupt@quicinc.com, quic_skananth@quicinc.com,
	quic_ramkri@quicinc.com, quic_parass@quicinc.com,
	krzysztof.kozlowski@linaro.org,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 1/4] PCI: endpoint: Add D-state change notifier support
Message-ID: <202308021312.obgu7FWM-lkp@intel.com>
References: <1690948281-2143-2-git-send-email-quic_krichai@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1690948281-2143-2-git-send-email-quic_krichai@quicinc.com>

Hi Krishna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v6.5-rc4 next-20230801]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-chaitanya-chundru/PCI-endpoint-Add-D-state-change-notifier-support/20230802-115309
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/1690948281-2143-2-git-send-email-quic_krichai%40quicinc.com
patch subject: [PATCH v5 1/4] PCI: endpoint: Add D-state change notifier support
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230802/202308021312.obgu7FWM-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308021312.obgu7FWM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308021312.obgu7FWM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/endpoint/pci-epc-core.c:795:6: warning: no previous prototype for 'pci_epc_dstate_notity' [-Wmissing-prototypes]
     795 | void pci_epc_dstate_notity(struct pci_epc *epc, pci_power_t state)
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +/pci_epc_dstate_notity +795 drivers/pci/endpoint/pci-epc-core.c

   785	
   786	/**
   787	 * pci_epc_dstate_notity() - Notify the EPF driver that EPC device D-state
   788	 *			has changed
   789	 * @epc: the EPC device which has change in D-state
   790	 * @state: the changed D-state
   791	 *
   792	 * Invoke to Notify the EPF device that the EPC device has D-state has
   793	 * changed.
   794	 */
 > 795	void pci_epc_dstate_notity(struct pci_epc *epc, pci_power_t state)
   796	{
   797		struct pci_epf *epf;
   798	
   799		if (!epc || IS_ERR(epc))
   800			return;
   801	
   802		mutex_lock(&epc->list_lock);
   803		list_for_each_entry(epf, &epc->pci_epf, list) {
   804			mutex_lock(&epf->lock);
   805			if (epf->event_ops && epf->event_ops->dstate_notify)
   806				epf->event_ops->dstate_notify(epf, state);
   807			mutex_unlock(&epf->lock);
   808		}
   809		mutex_unlock(&epc->list_lock);
   810	}
   811	EXPORT_SYMBOL_GPL(pci_epc_dstate_notity);
   812	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
