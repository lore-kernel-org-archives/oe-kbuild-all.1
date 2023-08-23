Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36D520F16
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 06:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 938C3C433C7;
	Wed, 23 Aug 2023 06:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692771561;
	bh=hRs5dH0ZEPcb6II3vz8akVjaVIarEG42/y1v3tkpUzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UbMFTgwT5DIncy9OyNxvxDcjJUmUgPFw7S5x606CbXJpl2Ajsbj6TiDFa/YQ78dFo
	 1+xteboubD3G3s2MMuyXy7QqqaOpnoMuXlTFuZs1E0QwQR/S7H4ciOpbbZTs8BD8T0
	 8l8KYh2C/htx1VRg17/k91/sHkNTodHdEZ4IORwl7MM3q0gbMowADeU8FOT74pFuEG
	 jb6nHdr6AO1SubsNLRkHgMqKZliGUYRAHjHivlSBs95f500FCOHFu984DexcWtjTVw
	 sRvufy3n7QSLO17xEiOpa46LpK20gEYM9LCIxNrJUyUZht9U30Ml8YPOhPJ+lqxC6Z
	 x9ciOHFMWXwig==
Date: Wed, 23 Aug 2023 11:49:04 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	manivannan.sadhasivam@linaro.org, oe-kbuild-all@lists.linux.dev,
	helgaas@kernel.org, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_vbadigan@quicinc.com, quic_nitegupt@quicinc.com,
	quic_skananth@quicinc.com, quic_ramkri@quicinc.com,
	quic_parass@quicinc.com, krzysztof.kozlowski@linaro.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 1/4] PCI: endpoint: Add D-state change notifier support
Message-ID: <20230823061904.GC3737@thinkpad>
References: <1690948281-2143-2-git-send-email-quic_krichai@quicinc.com>
 <202308021312.obgu7FWM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202308021312.obgu7FWM-lkp@intel.com>

On Wed, Aug 02, 2023 at 01:14:44PM +0800, kernel test robot wrote:
> Hi Krishna,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on pci/next]
> [also build test WARNING on pci/for-linus linus/master v6.5-rc4 next-20230801]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-chaitanya-chundru/PCI-endpoint-Add-D-state-change-notifier-support/20230802-115309
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
> patch link:    https://lore.kernel.org/r/1690948281-2143-2-git-send-email-quic_krichai%40quicinc.com
> patch subject: [PATCH v5 1/4] PCI: endpoint: Add D-state change notifier support
> config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230802/202308021312.obgu7FWM-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230802/202308021312.obgu7FWM-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308021312.obgu7FWM-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/pci/endpoint/pci-epc-core.c:795:6: warning: no previous prototype for 'pci_epc_dstate_notity' [-Wmissing-prototypes]
>      795 | void pci_epc_dstate_notity(struct pci_epc *epc, pci_power_t state)

This tells that you haven't build tested the series before sending. Please
always do both build and functionality testing before sending each iteration.

- Mani

>          |      ^~~~~~~~~~~~~~~~~~~~~
> 
> 
> vim +/pci_epc_dstate_notity +795 drivers/pci/endpoint/pci-epc-core.c
> 
>    785	
>    786	/**
>    787	 * pci_epc_dstate_notity() - Notify the EPF driver that EPC device D-state
>    788	 *			has changed
>    789	 * @epc: the EPC device which has change in D-state
>    790	 * @state: the changed D-state
>    791	 *
>    792	 * Invoke to Notify the EPF device that the EPC device has D-state has
>    793	 * changed.
>    794	 */
>  > 795	void pci_epc_dstate_notity(struct pci_epc *epc, pci_power_t state)
>    796	{
>    797		struct pci_epf *epf;
>    798	
>    799		if (!epc || IS_ERR(epc))
>    800			return;
>    801	
>    802		mutex_lock(&epc->list_lock);
>    803		list_for_each_entry(epf, &epc->pci_epf, list) {
>    804			mutex_lock(&epf->lock);
>    805			if (epf->event_ops && epf->event_ops->dstate_notify)
>    806				epf->event_ops->dstate_notify(epf, state);
>    807			mutex_unlock(&epf->lock);
>    808		}
>    809		mutex_unlock(&epc->list_lock);
>    810	}
>    811	EXPORT_SYMBOL_GPL(pci_epc_dstate_notity);
>    812	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

-- 
மணிவண்ணன் சதாசிவம்
