Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C457E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Oct 2023 00:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696378517; x=1727914517;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WQ1cPFMuwntsn0xsjWHgdPK0CdbYs0JJAZR/OiPIh3Y=;
  b=Ypeuy8eG/f+HBHsvsF8i8E1aJBxRWpLz6L0dbIjLnK9VqB8Q86DmbcYV
   7ELDNvZFE9SSR3KBrjDMbQPf6FDZ6OukrC+euIM1RJReaELg5FgWDm7XH
   FMucJFGZwf07uLnaBY6r37KPC6ftDJBmv5eYJnnBCx6LWW37ChW2elu+m
   gDf47I/rpDKhP8+Ui0jDMC+HTqdnR6PZIBOCxhtTlAh4Mjsn3hYKiBn/2
   S58Nkm0kC+SO6ygqucup8Z/2wsiGr0dmkvGjkF8svpn/tDM3d9ky4FEat
   i1tFGqXiYZpP5T3MAK3fhws+gXrRSp7riiPCsdfSJNLnu7LEfhF325ko6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="469283603"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="469283603"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 17:15:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="727806991"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="727806991"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 03 Oct 2023 17:15:14 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnpXk-0009xc-0z;
	Wed, 04 Oct 2023 00:15:12 +0000
Date: Wed, 4 Oct 2023 08:15:04 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:wifi/bcm4388 123/126]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c:269:12: warning:
 unused variable 'eventmask'
Message-ID: <202310040849.IJoIQhgB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/AsahiLinux/linux wifi/bcm4388
head:   eedf73be4f43c5bff194ae9f17ccba85360e879b
commit: fa81b02898806b01d7a3c34cbd2e1cdf5293b762 [123/126] tmp hacks
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231004/202310040849.IJoIQhgB-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231004/202310040849.IJoIQhgB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310040849.IJoIQhgB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c: In function 'brcmf_c_preinit_dcmds':
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c:269:12: warning: unused variable 'eventmask' [-Wunused-variable]
     269 |         s8 eventmask[BRCMF_EVENTING_MASK_LEN];
         |            ^~~~~~~~~


vim +/eventmask +269 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c

5b3ee9987f58560 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Hector Martin    2023-02-14  265  
0af29bf7c1ddf5f drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Hante Meuleman   2012-10-22  266  int brcmf_c_preinit_dcmds(struct brcmf_if *ifp)
5b435de0d786869 drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Arend van Spriel 2011-10-05  267  {
dcb1471bc6d0541 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Rafał Miłecki    2019-02-19  268  	struct brcmf_pub *drvr = ifp->drvr;
0af29bf7c1ddf5f drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Hante Meuleman   2012-10-22 @269  	s8 eventmask[BRCMF_EVENTING_MASK_LEN];
0af29bf7c1ddf5f drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Hante Meuleman   2012-10-22  270  	u8 buf[BRCMF_DCMD_SMLEN];
756a2b390874d27 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Arend Van Spriel 2018-03-22  271  	struct brcmf_bus *bus;
4862290319ade31 drivers/net/wireless/brcm80211/brcmfmac/common.c          Arend van Spriel 2015-01-25  272  	struct brcmf_rev_info_le revinfo;
4862290319ade31 drivers/net/wireless/brcm80211/brcmfmac/common.c          Arend van Spriel 2015-01-25  273  	struct brcmf_rev_info *ri;
fdd0bd88ceaecf7 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Chung-Hsien Hsu  2017-11-10  274  	char *clmver;
0af29bf7c1ddf5f drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Hante Meuleman   2012-10-22  275  	char *ptr;
0af29bf7c1ddf5f drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Hante Meuleman   2012-10-22  276  	s32 err;
5b435de0d786869 drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Arend van Spriel 2011-10-05  277  
716c220b4d990a4 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Pavel Löbl       2022-05-06  278  	if (is_valid_ether_addr(ifp->mac_addr)) {
716c220b4d990a4 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Pavel Löbl       2022-05-06  279  		/* set mac address */
cf1239e5b7bf3db drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Hans de Goede    2022-07-08  280  		err = brcmf_c_set_cur_etheraddr(ifp, ifp->mac_addr);
cf1239e5b7bf3db drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Hans de Goede    2022-07-08  281  		if (err < 0)
716c220b4d990a4 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Pavel Löbl       2022-05-06  282  			goto done;
716c220b4d990a4 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Pavel Löbl       2022-05-06  283  	} else {
716c220b4d990a4 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Pavel Löbl       2022-05-06  284  		/* retrieve mac address */
0af29bf7c1ddf5f drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Hante Meuleman   2012-10-22  285  		err = brcmf_fil_iovar_data_get(ifp, "cur_etheraddr", ifp->mac_addr,
0af29bf7c1ddf5f drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Hante Meuleman   2012-10-22  286  					       sizeof(ifp->mac_addr));
0af29bf7c1ddf5f drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Hante Meuleman   2012-10-22  287  		if (err < 0) {
dcb1471bc6d0541 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Rafał Miłecki    2019-02-19  288  			bphy_err(drvr, "Retrieving cur_etheraddr failed, %d\n", err);
0af29bf7c1ddf5f drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Hante Meuleman   2012-10-22  289  			goto done;
4af4c0b93c15ece drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Hans de Goede    2022-07-08  290  		}
4af4c0b93c15ece drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Hans de Goede    2022-07-08  291  
4af4c0b93c15ece drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Hans de Goede    2022-07-08  292  		if (ether_addr_equal_unaligned(ifp->mac_addr, brcmf_default_mac_address)) {
4af4c0b93c15ece drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Hans de Goede    2022-07-08  293  			bphy_err(drvr, "Default MAC is used, replacing with random MAC to avoid conflicts\n");
4af4c0b93c15ece drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Hans de Goede    2022-07-08  294  			eth_random_addr(ifp->mac_addr);
4af4c0b93c15ece drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Hans de Goede    2022-07-08  295  			ifp->ndev->addr_assign_type = NET_ADDR_RANDOM;
4af4c0b93c15ece drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Hans de Goede    2022-07-08  296  			err = brcmf_c_set_cur_etheraddr(ifp, ifp->mac_addr);
4af4c0b93c15ece drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Hans de Goede    2022-07-08  297  			if (err < 0)
4af4c0b93c15ece drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Hans de Goede    2022-07-08  298  				goto done;
5b435de0d786869 drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Arend van Spriel 2011-10-05  299  		}
716c220b4d990a4 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Pavel Löbl       2022-05-06  300  	}
716c220b4d990a4 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Pavel Löbl       2022-05-06  301  
0af29bf7c1ddf5f drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Hante Meuleman   2012-10-22  302  	memcpy(ifp->drvr->mac, ifp->mac_addr, sizeof(ifp->drvr->mac));
1eb4e9f62998194 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Wright Feng      2020-06-04  303  	memcpy(ifp->drvr->wiphy->perm_addr, ifp->drvr->mac, ETH_ALEN);
5b435de0d786869 drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Arend van Spriel 2011-10-05  304  
756a2b390874d27 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Arend Van Spriel 2018-03-22  305  	bus = ifp->drvr->bus_if;
756a2b390874d27 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Arend Van Spriel 2018-03-22  306  	ri = &ifp->drvr->revinfo;
756a2b390874d27 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Arend Van Spriel 2018-03-22  307  
4862290319ade31 drivers/net/wireless/brcm80211/brcmfmac/common.c          Arend van Spriel 2015-01-25  308  	err = brcmf_fil_cmd_data_get(ifp, BRCMF_C_GET_REVINFO,
4862290319ade31 drivers/net/wireless/brcm80211/brcmfmac/common.c          Arend van Spriel 2015-01-25  309  				     &revinfo, sizeof(revinfo));
4862290319ade31 drivers/net/wireless/brcm80211/brcmfmac/common.c          Arend van Spriel 2015-01-25  310  	if (err < 0) {
dcb1471bc6d0541 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Rafał Miłecki    2019-02-19  311  		bphy_err(drvr, "retrieving revision info failed, %d\n", err);
bf99f11df4de45f drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Wolfram Sang     2022-08-30  312  		strscpy(ri->chipname, "UNKNOWN", sizeof(ri->chipname));
4862290319ade31 drivers/net/wireless/brcm80211/brcmfmac/common.c          Arend van Spriel 2015-01-25  313  	} else {
4862290319ade31 drivers/net/wireless/brcm80211/brcmfmac/common.c          Arend van Spriel 2015-01-25  314  		ri->vendorid = le32_to_cpu(revinfo.vendorid);
4862290319ade31 drivers/net/wireless/brcm80211/brcmfmac/common.c          Arend van Spriel 2015-01-25  315  		ri->deviceid = le32_to_cpu(revinfo.deviceid);
4862290319ade31 drivers/net/wireless/brcm80211/brcmfmac/common.c          Arend van Spriel 2015-01-25  316  		ri->radiorev = le32_to_cpu(revinfo.radiorev);
4862290319ade31 drivers/net/wireless/brcm80211/brcmfmac/common.c          Arend van Spriel 2015-01-25  317  		ri->corerev = le32_to_cpu(revinfo.corerev);
4862290319ade31 drivers/net/wireless/brcm80211/brcmfmac/common.c          Arend van Spriel 2015-01-25  318  		ri->boardid = le32_to_cpu(revinfo.boardid);
4862290319ade31 drivers/net/wireless/brcm80211/brcmfmac/common.c          Arend van Spriel 2015-01-25  319  		ri->boardvendor = le32_to_cpu(revinfo.boardvendor);
4862290319ade31 drivers/net/wireless/brcm80211/brcmfmac/common.c          Arend van Spriel 2015-01-25  320  		ri->boardrev = le32_to_cpu(revinfo.boardrev);
4862290319ade31 drivers/net/wireless/brcm80211/brcmfmac/common.c          Arend van Spriel 2015-01-25  321  		ri->driverrev = le32_to_cpu(revinfo.driverrev);
4862290319ade31 drivers/net/wireless/brcm80211/brcmfmac/common.c          Arend van Spriel 2015-01-25  322  		ri->ucoderev = le32_to_cpu(revinfo.ucoderev);
4862290319ade31 drivers/net/wireless/brcm80211/brcmfmac/common.c          Arend van Spriel 2015-01-25  323  		ri->bus = le32_to_cpu(revinfo.bus);
4862290319ade31 drivers/net/wireless/brcm80211/brcmfmac/common.c          Arend van Spriel 2015-01-25  324  		ri->phytype = le32_to_cpu(revinfo.phytype);
4862290319ade31 drivers/net/wireless/brcm80211/brcmfmac/common.c          Arend van Spriel 2015-01-25  325  		ri->phyrev = le32_to_cpu(revinfo.phyrev);
4862290319ade31 drivers/net/wireless/brcm80211/brcmfmac/common.c          Arend van Spriel 2015-01-25  326  		ri->anarev = le32_to_cpu(revinfo.anarev);
4862290319ade31 drivers/net/wireless/brcm80211/brcmfmac/common.c          Arend van Spriel 2015-01-25  327  		ri->chippkg = le32_to_cpu(revinfo.chippkg);
4862290319ade31 drivers/net/wireless/brcm80211/brcmfmac/common.c          Arend van Spriel 2015-01-25  328  		ri->nvramrev = le32_to_cpu(revinfo.nvramrev);
756a2b390874d27 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Arend Van Spriel 2018-03-22  329  
856d5a011c86b59 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Arend Van Spriel 2018-03-22  330  		/* use revinfo if not known yet */
756a2b390874d27 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Arend Van Spriel 2018-03-22  331  		if (!bus->chip) {
756a2b390874d27 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Arend Van Spriel 2018-03-22  332  			bus->chip = le32_to_cpu(revinfo.chipnum);
756a2b390874d27 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Arend Van Spriel 2018-03-22  333  			bus->chiprev = le32_to_cpu(revinfo.chiprev);
756a2b390874d27 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Arend Van Spriel 2018-03-22  334  		}
4862290319ade31 drivers/net/wireless/brcm80211/brcmfmac/common.c          Arend van Spriel 2015-01-25  335  	}
7f52c81d02a2794 drivers/net/wireless/brcm80211/brcmfmac/common.c          Arend van Spriel 2015-01-25  336  	ri->result = err;
4862290319ade31 drivers/net/wireless/brcm80211/brcmfmac/common.c          Arend van Spriel 2015-01-25  337  
756a2b390874d27 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Arend Van Spriel 2018-03-22  338  	if (bus->chip)
756a2b390874d27 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Arend Van Spriel 2018-03-22  339  		brcmf_chip_name(bus->chip, bus->chiprev,
756a2b390874d27 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Arend Van Spriel 2018-03-22  340  				ri->chipname, sizeof(ri->chipname));
756a2b390874d27 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Arend Van Spriel 2018-03-22  341  
fdd0bd88ceaecf7 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Chung-Hsien Hsu  2017-11-10  342  	/* Do any CLM downloading */
fdd0bd88ceaecf7 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Chung-Hsien Hsu  2017-11-10  343  	err = brcmf_c_process_clm_blob(ifp);
fdd0bd88ceaecf7 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Chung-Hsien Hsu  2017-11-10  344  	if (err < 0) {
dcb1471bc6d0541 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Rafał Miłecki    2019-02-19  345  		bphy_err(drvr, "download CLM blob file failed, %d\n", err);
fdd0bd88ceaecf7 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Chung-Hsien Hsu  2017-11-10  346  		goto done;
fdd0bd88ceaecf7 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Chung-Hsien Hsu  2017-11-10  347  	}
fdd0bd88ceaecf7 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Chung-Hsien Hsu  2017-11-10  348  
dd7e55401fec58a drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Hector Martin    2023-02-14  349  	/* Do TxCap downloading, if needed */
dd7e55401fec58a drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Hector Martin    2023-02-14  350  	err = brcmf_c_process_txcap_blob(ifp);
dd7e55401fec58a drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Hector Martin    2023-02-14  351  	if (err < 0) {
dd7e55401fec58a drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Hector Martin    2023-02-14  352  		bphy_err(drvr, "download TxCap blob file failed, %d\n", err);
dd7e55401fec58a drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Hector Martin    2023-02-14  353  		goto done;
dd7e55401fec58a drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Hector Martin    2023-02-14  354  	}
dd7e55401fec58a drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Hector Martin    2023-02-14  355  
5b3ee9987f58560 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Hector Martin    2023-02-14  356  	/* Download external calibration blob, if available */
5b3ee9987f58560 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Hector Martin    2023-02-14  357  	err = brcmf_c_process_cal_blob(ifp);
5b3ee9987f58560 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Hector Martin    2023-02-14  358  	if (err < 0) {
5b3ee9987f58560 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Hector Martin    2023-02-14  359  		bphy_err(drvr, "download calibration blob file failed, %d\n", err);
5b3ee9987f58560 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Hector Martin    2023-02-14  360  		goto done;
5b3ee9987f58560 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Hector Martin    2023-02-14  361  	}
5b3ee9987f58560 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Hector Martin    2023-02-14  362  
5b435de0d786869 drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Arend van Spriel 2011-10-05  363  	/* query for 'ver' to get version info from firmware */
5b435de0d786869 drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Arend van Spriel 2011-10-05  364  	memset(buf, 0, sizeof(buf));
0af29bf7c1ddf5f drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Hante Meuleman   2012-10-22  365  	err = brcmf_fil_iovar_data_get(ifp, "ver", buf, sizeof(buf));
0af29bf7c1ddf5f drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Hante Meuleman   2012-10-22  366  	if (err < 0) {
dcb1471bc6d0541 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Rafał Miłecki    2019-02-19  367  		bphy_err(drvr, "Retrieving version information failed, %d\n",
0af29bf7c1ddf5f drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Hante Meuleman   2012-10-22  368  			 err);
0af29bf7c1ddf5f drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Hante Meuleman   2012-10-22  369  		goto done;
0af29bf7c1ddf5f drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Hante Meuleman   2012-10-22  370  	}
0a06cadcc2a0044 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Jisoo Jang       2022-11-15  371  	buf[sizeof(buf) - 1] = '\0';
0af29bf7c1ddf5f drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Hante Meuleman   2012-10-22  372  	ptr = (char *)buf;
5b435de0d786869 drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Arend van Spriel 2011-10-05  373  	strsep(&ptr, "\n");
55685b8f2f9f419 drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Arend van Spriel 2013-11-29  374  
5b435de0d786869 drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Arend van Spriel 2011-10-05  375  	/* Print fw version info */
756a2b390874d27 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Arend Van Spriel 2018-03-22  376  	brcmf_info("Firmware: %s %s\n", ri->chipname, buf);
5b435de0d786869 drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Arend van Spriel 2011-10-05  377  
55685b8f2f9f419 drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Arend van Spriel 2013-11-29  378  	/* locate firmware version number for ethtool */
683b9728f288956 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Jisoo Jang       2022-11-02  379  	ptr = strrchr(buf, ' ');
683b9728f288956 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Jisoo Jang       2022-11-02  380  	if (!ptr) {
683b9728f288956 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Jisoo Jang       2022-11-02  381  		bphy_err(drvr, "Retrieving version number failed");
683b9728f288956 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Jisoo Jang       2022-11-02  382  		goto done;
683b9728f288956 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Jisoo Jang       2022-11-02  383  	}
683b9728f288956 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Jisoo Jang       2022-11-02  384  	strscpy(ifp->drvr->fwver, ptr + 1, sizeof(ifp->drvr->fwver));
55685b8f2f9f419 drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Arend van Spriel 2013-11-29  385  
fdd0bd88ceaecf7 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Chung-Hsien Hsu  2017-11-10  386  	/* Query for 'clmver' to get CLM version info from firmware */
fdd0bd88ceaecf7 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Chung-Hsien Hsu  2017-11-10  387  	memset(buf, 0, sizeof(buf));
fdd0bd88ceaecf7 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Chung-Hsien Hsu  2017-11-10  388  	err = brcmf_fil_iovar_data_get(ifp, "clmver", buf, sizeof(buf));
fdd0bd88ceaecf7 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Chung-Hsien Hsu  2017-11-10  389  	if (err) {
fdd0bd88ceaecf7 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Chung-Hsien Hsu  2017-11-10  390  		brcmf_dbg(TRACE, "retrieving clmver failed, %d\n", err);
fdd0bd88ceaecf7 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Chung-Hsien Hsu  2017-11-10  391  	} else {
660145d708be52f drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Jisoo Jang       2022-12-30  392  		buf[sizeof(buf) - 1] = '\0';
fdd0bd88ceaecf7 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Chung-Hsien Hsu  2017-11-10  393  		clmver = (char *)buf;
fdd0bd88ceaecf7 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Chung-Hsien Hsu  2017-11-10  394  
fdd0bd88ceaecf7 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Chung-Hsien Hsu  2017-11-10  395  		/* Replace all newline/linefeed characters with space
fdd0bd88ceaecf7 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Chung-Hsien Hsu  2017-11-10  396  		 * character
fdd0bd88ceaecf7 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Chung-Hsien Hsu  2017-11-10  397  		 */
cb18e2e9ec71d42 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Rasmus Villemoes 2018-08-22  398  		strreplace(clmver, '\n', ' ');
fdd0bd88ceaecf7 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Chung-Hsien Hsu  2017-11-10  399  
660145d708be52f drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Jisoo Jang       2022-12-30  400  		/* store CLM version for adding it to revinfo debugfs file */
660145d708be52f drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Jisoo Jang       2022-12-30  401  		memcpy(ifp->drvr->clmver, clmver, sizeof(ifp->drvr->clmver));
660145d708be52f drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Jisoo Jang       2022-12-30  402  
fdd0bd88ceaecf7 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Chung-Hsien Hsu  2017-11-10  403  		brcmf_dbg(INFO, "CLM version = %s\n", clmver);
fdd0bd88ceaecf7 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Chung-Hsien Hsu  2017-11-10  404  	}
fdd0bd88ceaecf7 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Chung-Hsien Hsu  2017-11-10  405  
5e787f7588ff69d drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Daniel Kim       2014-06-21  406  	/* set mpc */
5e787f7588ff69d drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Daniel Kim       2014-06-21  407  	err = brcmf_fil_iovar_int_set(ifp, "mpc", 1);
5e787f7588ff69d drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Daniel Kim       2014-06-21  408  	if (err) {
dcb1471bc6d0541 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Rafał Miłecki    2019-02-19  409  		bphy_err(drvr, "failed setting mpc\n");
5e787f7588ff69d drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Daniel Kim       2014-06-21  410  		goto done;
5e787f7588ff69d drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Daniel Kim       2014-06-21  411  	}
5e787f7588ff69d drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Daniel Kim       2014-06-21  412  
7705ba6f7badb8c drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c Arend van Spriel 2016-04-17  413  	brcmf_c_set_joinpref_default(ifp);
e09cc63dc368f26 drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c      Daniel Kim       2014-05-12  414  

:::::: The code at line 269 was first introduced by commit
:::::: 0af29bf7c1ddf5f3c35577409de46ede5e8d7845 brcmfmac: use fwil for default configuration setup.

:::::: TO: Hante Meuleman <meuleman@broadcom.com>
:::::: CC: John W. Linville <linville@tuxdriver.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
