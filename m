Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CC8D526
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Oct 2023 08:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696320248; x=1727856248;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LirqbwRzzsZCyLyXqNujDbVw278QRaT5cAZtZhj4Tks=;
  b=Awk86/FNRZW9JabL1P0Q/EHUa7BEXyc1jXtHgeRMutDUYn8PLk+HVRqG
   JP6iRsqqF9EBcbHYM65tlJK5qD3VvwJzOK4wmxJ2iepAxQjOkhiyA63EC
   RyuWkYsKaiFSkurRPBu3dc/7yxq4Vc1j2mbL5JNq6LSEpTze7L+q+pybh
   tU5nQIm3LRI0PlkoDtabV4VcFxl0+Cr5e65APUd14Bn4u2SZR1y8utSS6
   6BiC/j0J+IL04vZQ0hCUKssgD8C3/jN1hVMbaAXZUJwT1oCjAuLlGeK0a
   5jlX/qGPWfbi92023JjZZtMs1x1PY3Ei6rN61f8fwEq9Q9CzYiy4yRlAh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="1408388"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="1408388"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 01:04:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="866781968"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="866781968"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 03 Oct 2023 01:04:03 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnaNt-0006uL-0y;
	Tue, 03 Oct 2023 08:04:01 +0000
Date: Tue, 3 Oct 2023 16:03:11 +0800
From: kernel test robot <lkp@intel.com>
To: Robert Marko <robimarko@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next] net: phy: aquantia: add firmware load
 support
Message-ID: <202310031545.L584NIxt-lkp@intel.com>
References: <20230930104008.234831-1-robimarko@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230930104008.234831-1-robimarko@gmail.com>

Hi Robert,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Robert-Marko/net-phy-aquantia-add-firmware-load-support/20230930-184113
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230930104008.234831-1-robimarko%40gmail.com
patch subject: [RFC PATCH net-next] net: phy: aquantia: add firmware load support
config: i386-randconfig-063-20231003 (https://download.01.org/0day-ci/archive/20231003/202310031545.L584NIxt-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310031545.L584NIxt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310031545.L584NIxt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/phy/aquantia_main.c:746:14: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] addr @@     got restricted __le32 [usertype] @@
   drivers/net/phy/aquantia_main.c:746:14: sparse:     expected unsigned int [usertype] addr
   drivers/net/phy/aquantia_main.c:746:14: sparse:     got restricted __le32 [usertype]
>> drivers/net/phy/aquantia_main.c:776:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [usertype] word @@     got restricted __be32 [usertype] @@
   drivers/net/phy/aquantia_main.c:776:22: sparse:     expected unsigned int [addressable] [usertype] word
   drivers/net/phy/aquantia_main.c:776:22: sparse:     got restricted __be32 [usertype]
>> drivers/net/phy/aquantia_main.c:803:20: sparse: sparse: cast to restricted __be16
>> drivers/net/phy/aquantia_main.c:813:26: sparse: sparse: cast to restricted __le32
   drivers/net/phy/aquantia_main.c:823:23: sparse: sparse: cast to restricted __le32
   drivers/net/phy/aquantia_main.c:824:21: sparse: sparse: cast to restricted __le32
   drivers/net/phy/aquantia_main.c:825:23: sparse: sparse: cast to restricted __le32
   drivers/net/phy/aquantia_main.c:826:21: sparse: sparse: cast to restricted __le32

vim +746 drivers/net/phy/aquantia_main.c

   737	
   738	/* load data into the phy's memory */
   739	static int aquantia_load_memory(struct phy_device *phydev, u32 addr,
   740					const u8 *data, size_t len)
   741	{
   742		u16 crc = 0, up_crc;
   743		size_t pos;
   744	
   745		/* PHY expect addr in LE */
 > 746		addr = cpu_to_le32(addr);
   747	
   748		phy_write_mmd(phydev, MDIO_MMD_VEND1,
   749			      VEND1_GLOBAL_MAILBOX_INTERFACE1,
   750			      VEND1_GLOBAL_MAILBOX_INTERFACE1_CRC_RESET);
   751		phy_write_mmd(phydev, MDIO_MMD_VEND1,
   752			      VEND1_GLOBAL_MAILBOX_INTERFACE3,
   753			      VEND1_GLOBAL_MAILBOX_INTERFACE3_MSW_ADDR(addr));
   754		phy_write_mmd(phydev, MDIO_MMD_VEND1,
   755			      VEND1_GLOBAL_MAILBOX_INTERFACE4,
   756			      VEND1_GLOBAL_MAILBOX_INTERFACE4_LSW_ADDR(addr));
   757	
   758		for (pos = 0; pos < len; pos += min(sizeof(u32), len - pos)) {
   759			u32 word = 0;
   760	
   761			memcpy(&word, data + pos, min(sizeof(u32), len - pos));
   762	
   763			phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLOBAL_MAILBOX_INTERFACE5,
   764				      VEND1_GLOBAL_MAILBOX_INTERFACE5_MSW_DATA(word));
   765			phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLOBAL_MAILBOX_INTERFACE6,
   766				      VEND1_GLOBAL_MAILBOX_INTERFACE6_LSW_DATA(word));
   767	
   768			phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLOBAL_MAILBOX_INTERFACE1,
   769				      VEND1_GLOBAL_MAILBOX_INTERFACE1_EXECUTE |
   770				      VEND1_GLOBAL_MAILBOX_INTERFACE1_WRITE);
   771	
   772			/* calculate CRC as we load data to the mailbox.
   773			 * We convert word to big-endiang as PHY is BE and ailbox will
   774			 * return a BE crc.
   775			 */
 > 776			word = cpu_to_be32(word);
   777			crc = crc_ccitt_false(crc, (u8 *)&word, sizeof(word));
   778		}
   779	
   780		up_crc = phy_read_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLOBAL_MAILBOX_INTERFACE2);
   781		if (crc != up_crc) {
   782			phydev_err(phydev, "CRC mismatch: calculated 0x%04x PHY 0x%04x\n",
   783				   crc, up_crc);
   784			return -EINVAL;
   785		}
   786	
   787		return 0;
   788	}
   789	
   790	static int aqr_fw_boot(struct phy_device *phydev, const u8 *data, size_t size)
   791	{
   792		const struct aqr_fw_header *header;
   793		u32 iram_offset = 0, iram_size = 0;
   794		u32 dram_offset = 0, dram_size = 0;
   795		char version[VERSION_STRING_SIZE];
   796		u16 calculated_crc, read_crc;
   797		u32 primary_offset = 0;
   798		int ret;
   799	
   800		/* extract saved crc at the end of the fw */
   801		memcpy(&read_crc, data + size - 2, sizeof(read_crc));
   802		/* crc is saved in big-endian as PHY is BE */
 > 803		read_crc = be16_to_cpu(read_crc);
   804		calculated_crc = crc_ccitt_false(0, data, size - 2);
   805		if (read_crc != calculated_crc) {
   806			phydev_err(phydev, "bad firmware CRC: file 0x%04x calculated 0x%04x\n",
   807				   read_crc, calculated_crc);
   808			return -EINVAL;
   809		}
   810	
   811		/* Get the primary offset to extract DRAM and IRAM sections. */
   812		memcpy(&primary_offset, data + PRIMARY_OFFSET_OFFSET, sizeof(u16));
 > 813		primary_offset = PRIMARY_OFFSET(le32_to_cpu(primary_offset));
   814	
   815		/* Find the DRAM and IRAM sections within the firmware file. */
   816		header = (struct aqr_fw_header *)(data + primary_offset + HEADER_OFFSET);
   817		memcpy(&iram_offset, &header->iram_offset, sizeof(u8) * 3);
   818		memcpy(&iram_size, &header->iram_size, sizeof(u8) * 3);
   819		memcpy(&dram_offset, &header->dram_offset, sizeof(u8) * 3);
   820		memcpy(&dram_size, &header->dram_size, sizeof(u8) * 3);
   821	
   822		/* offset are in LE and values needs to be converted to cpu endian */
   823		iram_offset = le32_to_cpu(iram_offset);
   824		iram_size = le32_to_cpu(iram_size);
   825		dram_offset = le32_to_cpu(dram_offset);
   826		dram_size = le32_to_cpu(dram_size);
   827	
   828		/* Increment the offset with the primary offset. */
   829		iram_offset += primary_offset;
   830		dram_offset += primary_offset;
   831	
   832		phydev_dbg(phydev, "primary %d IRAM offset=%d size=%d DRAM offset=%d size=%d\n",
   833			   primary_offset, iram_offset, iram_size, dram_offset, dram_size);
   834	
   835		strscpy(version, (char *)data + dram_offset + VERSION_STRING_OFFSET,
   836			VERSION_STRING_SIZE);
   837		phydev_info(phydev, "loading firmware version '%s'\n", version);
   838	
   839		/* stall the microcprocessor */
   840		phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLOBAL_CONTROL2,
   841			      VEND1_GLOBAL_CONTROL2_UP_RUN_STALL | VEND1_GLOBAL_CONTROL2_UP_RUN_STALL_OVD);
   842	
   843		phydev_dbg(phydev, "loading DRAM 0x%08x from offset=%d size=%d\n",
   844			   DRAM_BASE_ADDR, dram_offset, dram_size);
   845		ret = aquantia_load_memory(phydev, DRAM_BASE_ADDR, data + dram_offset,
   846					   dram_size);
   847		if (ret)
   848			return ret;
   849	
   850		phydev_dbg(phydev, "loading IRAM 0x%08x from offset=%d size=%d\n",
   851			   IRAM_BASE_ADDR, iram_offset, iram_size);
   852		ret = aquantia_load_memory(phydev, IRAM_BASE_ADDR, data + iram_offset,
   853					   iram_size);
   854		if (ret)
   855			return ret;
   856	
   857		/* make sure soft reset and low power mode are clear */
   858		phy_clear_bits_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLOBAL_SC,
   859				   VEND1_GLOBAL_SC_SOFT_RESET | VEND1_GLOBAL_SC_LOW_POWER);
   860	
   861		/* Release the microprocessor. UP_RESET must be held for 100 usec. */
   862		phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLOBAL_CONTROL2,
   863			      VEND1_GLOBAL_CONTROL2_UP_RUN_STALL |
   864			      VEND1_GLOBAL_CONTROL2_UP_RUN_STALL_OVD |
   865			      VEND1_GLOBAL_CONTROL2_UP_RUN_STALL_RST);
   866		usleep_range(UP_RESET_SLEEP, UP_RESET_SLEEP * 2);
   867	
   868		phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLOBAL_CONTROL2,
   869			      VEND1_GLOBAL_CONTROL2_UP_RUN_STALL_OVD);
   870	
   871		return 0;
   872	}
   873	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
