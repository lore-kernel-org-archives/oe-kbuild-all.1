Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02583EC2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jun 2023 06:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687848542; x=1719384542;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0AnZNjahVUYYky9VqJyLh92JUcGLL5kZzsjeWCOxiJw=;
  b=KyZcFjk7alP78K50b3JLQubex6vm3NuvyjLq9vei/xG+UG5PUZFI+YMY
   /jYHs410gt8Um6YPLmVbrLXDIOcyp2eKpbnGYGwoSjILt628DYMlsiMMt
   T00de3scp9yuBg6jVnm//pasAtWH7G7cBsbCXGVllg7JVp89lhg2eJc+K
   oq7ApcdmtnSHQASrUmrUcLOsbmRB+EBI0gH6CsdIc1ji/iZ9lkBr/fU3p
   2kF/6xvw+vqQ2MUxqAzdygFl2M3b62tjTBi/793IAjI0DunmpMsrE58BI
   fHuljZZVNNmGw+rXbN/hBkpUv372SqplXBh5fV7hfqjZQHkMsDaT7WfD9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="341833798"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="341833798"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 23:49:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="781741410"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="781741410"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 26 Jun 2023 23:48:59 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qE2VX-000Bm9-00;
	Tue, 27 Jun 2023 06:48:59 +0000
Date: Tue, 27 Jun 2023 14:48:25 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Subject: [arm-platforms:kvm-arm64/asahi-base-6.4 9/19]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1846:23: warning:
 unused variable 'randbuf'
Message-ID: <202306271421.iIdQ5eN6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/asahi-base-6.4
head:   7333165f9eb8694e854bdfb887ce358f501f1d3d
commit: 13de34d5091d4258c8c24cda5367c06bd95a5d18 [9/19] Merge remote-tracking branch 'asahi/bits/080-wifi' into kvm-asm64/asahi-base-6.4
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230627/202306271421.iIdQ5eN6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230627/202306271421.iIdQ5eN6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306271421.iIdQ5eN6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c: In function 'brcmf_pcie_download_fw_nvram':
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1846:23: warning: unused variable 'randbuf' [-Wunused-variable]
    1846 |                 void *randbuf;
         |                       ^~~~~~~
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1842:49: warning: unused variable 'footer' [-Wunused-variable]
    1842 |                 struct brcmf_random_seed_footer footer = {
         |                                                 ^~~~~~


vim +/randbuf +1846 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c

9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1810  
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1811  static int brcmf_pcie_download_fw_nvram(struct brcmf_pciedev_info *devinfo,
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1812  					const struct firmware *fw, void *nvram,
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1813  					u32 nvram_len)
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1814  {
8602e62441aba2 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Rafał Miłecki  2019-02-06  1815  	struct brcmf_bus *bus = dev_get_drvdata(&devinfo->pdev->dev);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1816  	u32 sharedram_addr;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1817  	u32 sharedram_addr_written;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1818  	u32 loop_counter;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1819  	int err;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1820  	u32 address;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1821  	u32 resetintr;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1822  
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1823  	brcmf_dbg(PCIE, "Halt ARM.\n");
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1824  	err = brcmf_pcie_enter_download_state(devinfo);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1825  	if (err)
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1826  		return err;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1827  
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1828  	brcmf_dbg(PCIE, "Download FW %s\n", devinfo->fw_name);
9466987f246758 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2022-02-01  1829  	memcpy_toio(devinfo->tcm + devinfo->ci->rambase,
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1830  		    (void *)fw->data, fw->size);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1831  
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1832  	resetintr = get_unaligned_le32(fw->data);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1833  	release_firmware(fw);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1834  
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1835  	/* reset last 4 bytes of RAM address. to be used for shared
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1836  	 * area. This identifies when FW is running
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1837  	 */
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1838  	brcmf_pcie_write_ram32(devinfo, devinfo->ci->ramsize - 4, 0);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1839  
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1840  	if (nvram) {
9587fcd02f3ed0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2021-12-23  1841  		size_t rand_len = BRCMF_RANDOM_SEED_LENGTH;
9587fcd02f3ed0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2021-12-23 @1842  		struct brcmf_random_seed_footer footer = {
9587fcd02f3ed0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2021-12-23  1843  			.length = cpu_to_le32(rand_len),
9587fcd02f3ed0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2021-12-23  1844  			.magic = cpu_to_le32(BRCMF_RANDOM_SEED_MAGIC),
9587fcd02f3ed0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2021-12-23  1845  		};
9587fcd02f3ed0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2021-12-23 @1846  		void *randbuf;
9587fcd02f3ed0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2021-12-23  1847  
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1848  		brcmf_dbg(PCIE, "Download NVRAM %s\n", devinfo->nvram_name);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1849  		address = devinfo->ci->rambase + devinfo->ci->ramsize -
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1850  			  nvram_len;
9466987f246758 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2022-02-01  1851  		memcpy_toio(devinfo->tcm + address, nvram, nvram_len);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1852  		brcmf_fw_nvram_free(nvram);
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1853  
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1854  		if (devinfo->otp.valid) {
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1855  			size_t rand_len = BRCMF_RANDOM_SEED_LENGTH;
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1856  			struct brcmf_random_seed_footer footer = {
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1857  				.length = cpu_to_le32(rand_len),
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1858  				.magic = cpu_to_le32(BRCMF_RANDOM_SEED_MAGIC),
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1859  			};
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1860  			void *randbuf;
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1861  
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1862  			/* Some Apple chips/firmwares expect a buffer of random
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1863  			 * data to be present before NVRAM
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1864  			 */
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1865  			brcmf_dbg(PCIE, "Download random seed\n");
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1866  
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1867  			address -= sizeof(footer);
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1868  			memcpy_toio(devinfo->tcm + address, &footer,
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1869  				    sizeof(footer));
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1870  
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1871  			address -= rand_len;
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1872  			randbuf = kzalloc(rand_len, GFP_KERNEL);
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1873  			get_random_bytes(randbuf, rand_len);
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1874  			memcpy_toio(devinfo->tcm + address, randbuf, rand_len);
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1875  			kfree(randbuf);
91918ce88d9fef drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-02-14  1876  		}
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1877  	} else {
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1878  		brcmf_dbg(PCIE, "No matching NVRAM file found %s\n",
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1879  			  devinfo->nvram_name);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1880  	}
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1881  
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1882  	sharedram_addr_written = brcmf_pcie_read_ram32(devinfo,
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1883  						       devinfo->ci->ramsize -
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1884  						       4);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1885  	brcmf_dbg(PCIE, "Bring ARM in running state\n");
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1886  	err = brcmf_pcie_exit_download_state(devinfo, resetintr);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1887  	if (err)
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1888  		return err;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1889  
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1890  	brcmf_dbg(PCIE, "Wait for FW init\n");
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1891  	sharedram_addr = sharedram_addr_written;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1892  	loop_counter = BRCMF_PCIE_FW_UP_TIMEOUT / 50;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1893  	while ((sharedram_addr == sharedram_addr_written) && (loop_counter)) {
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1894  		msleep(50);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1895  		sharedram_addr = brcmf_pcie_read_ram32(devinfo,
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1896  						       devinfo->ci->ramsize -
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1897  						       4);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1898  		loop_counter--;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1899  	}
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1900  	if (sharedram_addr == sharedram_addr_written) {
8602e62441aba2 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Rafał Miłecki  2019-02-06  1901  		brcmf_err(bus, "FW failed to initialize\n");
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1902  		return -ENODEV;
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1903  	}
e0a8ef4d7b4315 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Rafał Miłecki  2019-02-20  1904  	if (sharedram_addr < devinfo->ci->rambase ||
e0a8ef4d7b4315 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Rafał Miłecki  2019-02-20  1905  	    sharedram_addr >= devinfo->ci->rambase + devinfo->ci->ramsize) {
e0a8ef4d7b4315 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Rafał Miłecki  2019-02-20  1906  		brcmf_err(bus, "Invalid shared RAM address 0x%08x\n",
e0a8ef4d7b4315 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Rafał Miłecki  2019-02-20  1907  			  sharedram_addr);
e0a8ef4d7b4315 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Rafał Miłecki  2019-02-20  1908  		return -ENODEV;
e0a8ef4d7b4315 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Rafał Miłecki  2019-02-20  1909  	}
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1910  	brcmf_dbg(PCIE, "Shared RAM addr: 0x%08x\n", sharedram_addr);
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1911  
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1912  	return (brcmf_pcie_init_share_ram_info(devinfo, sharedram_addr));
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1913  }
9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1914  

:::::: The code at line 1846 was first introduced by commit
:::::: 9587fcd02f3ed021ff3b81f3b18db5f54ce8f663 brcmfmac: pcie: Provide a buffer of random bytes to the device

:::::: TO: Hector Martin <marcan@marcan.st>
:::::: CC: Hector Martin <marcan@marcan.st>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
