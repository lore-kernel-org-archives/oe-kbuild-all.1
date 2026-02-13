Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2894C275AF5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 18:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771006965; cv=none; b=PEhCQYWyqXhcX8xRgBIUlhwA6a10nKrifpWTDHD7xb+H76eqtFWTkxEaUr5RICtKjDI/k7AQBxuNqZZ95NPQpb3rpv9Of0QLvUhO032EGerAe67rXIPc0skUQwPp4Y+LRpcXCtKpnxHqe3jUywozqyLS7onGPGXr+MRMNFxod4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771006965; c=relaxed/simple;
	bh=kiDqA3MrPmXTVCWo0Mu3QhfrGS+YAV+RwHav3mGcpLM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rEErf5CoBVydO8bg/+Wye9Xzy0nousDH7C9W6TgtTGvgzL5jek/49elfBdDQZG/ohY8tVqwxonYRaDSvFZBpNMIS4BDoMV/6jZ3blz5c+xUtnOjoZJDsFlxi3wBzYyx/AUlKD9dmmIpbico6Omw1caDO2V2LknwiNxgD3ZHq120=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iwMcV37p; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iwMcV37p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771006963; x=1802542963;
  h=date:from:to:cc:subject:message-id;
  bh=kiDqA3MrPmXTVCWo0Mu3QhfrGS+YAV+RwHav3mGcpLM=;
  b=iwMcV37p5TLrg/OeoRCJlt3m5sCMgivQOjBQkhhpnuSQbIWRjGAgXMGP
   DVk91qCzcmcIQsx0FBt6mbzeXfIoEvSkyqdnmZOTE+BN00BxoOJiFpIqa
   ZC5gxFwlkUwPvqgR1VR/p/QI7htl8S7VN43/Jfn+OXD4ZIZlcPnJbCcOE
   sMZM7LUfc7zBF4xoU+/f3cTcG9ojb/XHYDVxkj2dwVMkchlxmBNbVNVN8
   3j7MMmVsy27fNqq/faivBfKKGu29g2EihSQWsEi8DSPM/R9zxBCbrMXZi
   7BFX9lR7Qe7w8W43anhX6zxn5rQVRFHrTPRlo3ZvCpeD2I/EoFsqMp8sK
   w==;
X-CSE-ConnectionGUID: N5A9Ub2/TPm15fdh7Z6jkA==
X-CSE-MsgGUID: fceOcD/NTQqZl7ok87u5FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83562894"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="83562894"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 10:22:43 -0800
X-CSE-ConnectionGUID: Gj6GG/rzTbm4sJJ3byveyw==
X-CSE-MsgGUID: JVuL6eqfT/GV971Sfr9Ecg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="211669857"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Feb 2026 10:22:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqxoM-00000000vkG-49LX;
	Fri, 13 Feb 2026 18:22:38 +0000
Date: Sat, 14 Feb 2026 02:22:06 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 54/590]
 drivers/mtd/spi-nor/core.c:2144:13: warning: variable 'sz' set but not used
Message-ID: <202602140232.7TdKJZj1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   865e73109750d465f06dee019396406a354eb9d2
commit: d3ee7e2ba589305a5079e434ce8aaac242479c83 [54/590] mtd: spi-nor: Add parallel memories support in spi-nor
config: x86_64-randconfig-161-20260213 (https://download.01.org/0day-ci/archive/20260214/202602140232.7TdKJZj1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140232.7TdKJZj1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140232.7TdKJZj1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mtd/spi-nor/core.c: In function 'spi_nor_read':
>> drivers/mtd/spi-nor/core.c:2144:13: warning: variable 'sz' set but not used [-Wunused-but-set-variable]
    2144 |         u64 sz = 0;
         |             ^~
   drivers/mtd/spi-nor/core.c: In function 'spi_nor_quad_enable':
   drivers/mtd/spi-nor/core.c:3353:13: warning: variable 'n_flash' set but not used [-Wunused-but-set-variable]
    3353 |         u32 n_flash = 1;
         |             ^~~~~~~
   drivers/mtd/spi-nor/core.c: In function 'spi_nor_init':
   drivers/mtd/spi-nor/core.c:3435:13: warning: variable 'n_flash' set but not used [-Wunused-but-set-variable]
    3435 |         u32 n_flash = 1;
         |             ^~~~~~~
   drivers/mtd/spi-nor/core.c: In function 'spi_nor_restore':
   drivers/mtd/spi-nor/core.c:3603:13: warning: variable 'n_flash' set but not used [-Wunused-but-set-variable]
    3603 |         u32 n_flash = 1;
         |             ^~~~~~~


vim +/sz +2144 drivers/mtd/spi-nor/core.c

  2133	
  2134	static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
  2135				size_t *retlen, u_char *buf)
  2136	{
  2137		struct spi_nor *nor = mtd_to_spi_nor(mtd);
  2138		struct spi_nor_flash_parameter *params;
  2139		ssize_t ret, read_len, len_lock =  len;
  2140		bool is_ofst_odd = false;
  2141		loff_t from_lock = from;
  2142		u_char *readbuf;
  2143		u32 n_flash = 1;
> 2144		u64 sz = 0;
  2145	
  2146		dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
  2147	
  2148		ret = spi_nor_prep_and_lock_rd(nor, from_lock, len_lock);
  2149		if (ret)
  2150			return ret;
  2151	
  2152		params = nor->params;
  2153		sz = params->size;
  2154	
  2155		if (nor->num_flash)
  2156			n_flash = nor->num_flash;
  2157	
  2158		/*
  2159		 * When even number of flashes are connected in parallel and the
  2160		 * requested read length is odd then read (len + 1) from offset + 1
  2161		 * and ignore offset[0] data.
  2162		 */
  2163		if ((nor->flags & SNOR_F_HAS_PARALLEL) && (!(n_flash % 2)) && (from & 0x01)) {
  2164			from = (loff_t)(from - 1);
  2165			len = (size_t)(len + 1);
  2166			is_ofst_odd = true;
  2167			readbuf = kmalloc(len, GFP_KERNEL);
  2168			if (!readbuf)
  2169				return -ENOMEM;
  2170		} else {
  2171			readbuf = buf;
  2172		}
  2173	
  2174		while (len) {
  2175			loff_t addr = from;
  2176	
  2177			if (nor->flags & SNOR_F_HAS_PARALLEL) {
  2178				u64 aux = addr;
  2179	
  2180				ret = do_div(aux, n_flash);
  2181				addr = aux;
  2182				nor->spimem->spi->cs_index_mask = SPI_NOR_ENABLE_MULTI_CS;
  2183				read_len = len;
  2184			} else {
  2185				nor->spimem->spi->cs_index_mask = SPI_NOR_ENABLE_CS0;
  2186			}
  2187	
  2188			if (nor->read_proto == SNOR_PROTO_8_8_8_DTR)
  2189				ret = spi_nor_octal_dtr_read(nor, addr, len, buf);
  2190			else
  2191				ret = spi_nor_read_data(nor, addr, len, buf);
  2192	
  2193			if (ret == 0) {
  2194				/* We shouldn't see 0-length reads */
  2195				ret = -EIO;
  2196				goto read_err;
  2197			}
  2198			if (ret < 0)
  2199				goto read_err;
  2200	
  2201			WARN_ON(ret > read_len);
  2202			if (is_ofst_odd) {
  2203				/*
  2204				 * Cannot read from odd offset in parallel mode.
  2205				 * So read len + 1 from offset + 1 from the flash
  2206				 * and copy len data from readbuf[1].
  2207				 */
  2208				memcpy(buf, (readbuf + 1), (len - 1));
  2209				*retlen += (ret - 1);
  2210			} else {
  2211				*retlen += ret;
  2212			}
  2213			buf += ret;
  2214			if (!is_ofst_odd)
  2215				readbuf += ret;
  2216			from += ret;
  2217			len -= ret;
  2218		}
  2219		ret = 0;
  2220	
  2221	read_err:
  2222		if (is_ofst_odd)
  2223			kfree(readbuf);
  2224	
  2225		spi_nor_unlock_and_unprep_rd(nor, from_lock, len_lock);
  2226		return ret;
  2227	}
  2228	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
