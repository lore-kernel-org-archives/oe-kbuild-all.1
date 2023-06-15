Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C8A1C29
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 07:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686815900; x=1718351900;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2atOAVkD+52MXjD/AIblBFbdwDLBS+8dgNDbZe3MNpo=;
  b=mb4QuIqrJjsp2yrqkP3OMp1HuTf9+hFgVUsyp/IpIoZiEZ9B6tL9rEPb
   JpsC+BDXnljMnbZJ4VxZfATtO0de3GxJFWLCO3g1u7iD97YrSZCl3g58k
   5AqFdweYyXR7NXdjiENjbW7UYHB5HLOEO8TcJcmJyfRbk5keJY6qb/8pC
   iwf0AfAdhOWxPjtQZTWTsU4vFpoW33LC67m3BRIadu2ZCyUa1K8j2CZ7z
   j7S8o+3noDuYsCJu9QANcDnOXmP1StDfq1nKNWSgfrgCHXe9iqQNIas3R
   3A5xrG/9IVf8KfR3WHC2X9Fo7U++HnreQ9N7smpKrJlt6LbWEiNNTl3pK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="358837638"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="358837638"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 00:58:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="1042549095"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="1042549095"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Jun 2023 00:58:18 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9hs1-0001dJ-37;
	Thu, 15 Jun 2023 07:58:17 +0000
Date: Thu, 15 Jun 2023 15:57:30 +0800
From: kernel test robot <lkp@intel.com>
To: William Qiu <william.qiu@starfivetech.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/3] spi: cadence-quadspi: Add clock configuration for
 StarFive JH7110 QSPI
Message-ID: <202306151528.WAq9bHnS-lkp@intel.com>
References: <20230602084925.215411-3-william.qiu@starfivetech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230602084925.215411-3-william.qiu@starfivetech.com>

Hi William,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on robh/for-next linus/master v6.4-rc6 next-20230614]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/William-Qiu/dt-bindings-qspi-cdns-qspi-nor-Add-clocks-for-StarFive-JH7110-SoC/20230602-165251
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20230602084925.215411-3-william.qiu%40starfivetech.com
patch subject: [PATCH v2 2/3] spi: cadence-quadspi: Add clock configuration for StarFive JH7110 QSPI
config: x86_64-randconfig-m001-20230614 (https://download.01.org/0day-ci/archive/20230615/202306151528.WAq9bHnS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306151528.WAq9bHnS-lkp@intel.com/

smatch warnings:
drivers/spi/spi-cadence-quadspi.c:1730 cqspi_probe() warn: unsigned 'cqspi->num_clks' is never less than zero.
drivers/spi/spi-cadence-quadspi.c:1732 cqspi_probe() warn: missing unwind goto?

vim +1730 drivers/spi/spi-cadence-quadspi.c

  1634	
  1635	static int cqspi_probe(struct platform_device *pdev)
  1636	{
  1637		const struct cqspi_driver_platdata *ddata;
  1638		struct reset_control *rstc, *rstc_ocp, *rstc_ref;
  1639		struct device *dev = &pdev->dev;
  1640		struct spi_master *master;
  1641		struct resource *res_ahb;
  1642		struct cqspi_st *cqspi;
  1643		int ret;
  1644		int irq;
  1645	
  1646		master = devm_spi_alloc_master(&pdev->dev, sizeof(*cqspi));
  1647		if (!master) {
  1648			dev_err(&pdev->dev, "spi_alloc_master failed\n");
  1649			return -ENOMEM;
  1650		}
  1651		master->mode_bits = SPI_RX_QUAD | SPI_RX_DUAL;
  1652		master->mem_ops = &cqspi_mem_ops;
  1653		master->mem_caps = &cqspi_mem_caps;
  1654		master->dev.of_node = pdev->dev.of_node;
  1655	
  1656		cqspi = spi_master_get_devdata(master);
  1657	
  1658		cqspi->pdev = pdev;
  1659		cqspi->master = master;
  1660		platform_set_drvdata(pdev, cqspi);
  1661	
  1662		/* Obtain configuration from OF. */
  1663		ret = cqspi_of_get_pdata(cqspi);
  1664		if (ret) {
  1665			dev_err(dev, "Cannot get mandatory OF data.\n");
  1666			return -ENODEV;
  1667		}
  1668	
  1669		/* Obtain QSPI clock. */
  1670		cqspi->clk = devm_clk_get(dev, NULL);
  1671		if (IS_ERR(cqspi->clk)) {
  1672			dev_err(dev, "Cannot claim QSPI clock.\n");
  1673			ret = PTR_ERR(cqspi->clk);
  1674			return ret;
  1675		}
  1676	
  1677		/* Obtain and remap controller address. */
  1678		cqspi->iobase = devm_platform_ioremap_resource(pdev, 0);
  1679		if (IS_ERR(cqspi->iobase)) {
  1680			dev_err(dev, "Cannot remap controller address.\n");
  1681			ret = PTR_ERR(cqspi->iobase);
  1682			return ret;
  1683		}
  1684	
  1685		/* Obtain and remap AHB address. */
  1686		cqspi->ahb_base = devm_platform_get_and_ioremap_resource(pdev, 1, &res_ahb);
  1687		if (IS_ERR(cqspi->ahb_base)) {
  1688			dev_err(dev, "Cannot remap AHB address.\n");
  1689			ret = PTR_ERR(cqspi->ahb_base);
  1690			return ret;
  1691		}
  1692		cqspi->mmap_phys_base = (dma_addr_t)res_ahb->start;
  1693		cqspi->ahb_size = resource_size(res_ahb);
  1694	
  1695		init_completion(&cqspi->transfer_complete);
  1696	
  1697		/* Obtain IRQ line. */
  1698		irq = platform_get_irq(pdev, 0);
  1699		if (irq < 0)
  1700			return -ENXIO;
  1701	
  1702		pm_runtime_enable(dev);
  1703		ret = pm_runtime_resume_and_get(dev);
  1704		if (ret < 0)
  1705			goto probe_pm_failed;
  1706	
  1707		ret = clk_prepare_enable(cqspi->clk);
  1708		if (ret) {
  1709			dev_err(dev, "Cannot enable QSPI clock.\n");
  1710			goto probe_clk_failed;
  1711		}
  1712	
  1713		/* Obtain QSPI reset control */
  1714		rstc = devm_reset_control_get_optional_exclusive(dev, "qspi");
  1715		if (IS_ERR(rstc)) {
  1716			ret = PTR_ERR(rstc);
  1717			dev_err(dev, "Cannot get QSPI reset.\n");
  1718			goto probe_reset_failed;
  1719		}
  1720	
  1721		rstc_ocp = devm_reset_control_get_optional_exclusive(dev, "qspi-ocp");
  1722		if (IS_ERR(rstc_ocp)) {
  1723			ret = PTR_ERR(rstc_ocp);
  1724			dev_err(dev, "Cannot get QSPI OCP reset.\n");
  1725			goto probe_reset_failed;
  1726		}
  1727	
  1728		if (of_device_is_compatible(pdev->dev.of_node, "starfive,jh7110-qspi")) {
  1729			cqspi->num_clks = devm_clk_bulk_get_all(dev, &cqspi->clks);
> 1730			if (cqspi->num_clks < 0) {
  1731				dev_err(dev, "Cannot claim clock: %u\n", cqspi->num_clks);
> 1732				return -EINVAL;
  1733			}
  1734	
  1735			ret = clk_bulk_prepare_enable(cqspi->num_clks, cqspi->clks);
  1736			if (ret)
  1737				dev_err(dev, "Cannot enable clock clks\n");
  1738	
  1739			rstc_ref = devm_reset_control_get_optional_exclusive(dev, "rstc_ref");
  1740			if (IS_ERR(rstc_ref)) {
  1741				ret = PTR_ERR(rstc_ref);
  1742				dev_err(dev, "Cannot get QSPI REF reset.\n");
  1743				goto probe_reset_failed;
  1744			}
  1745			reset_control_assert(rstc_ref);
  1746			reset_control_deassert(rstc_ref);
  1747		}
  1748	
  1749		reset_control_assert(rstc);
  1750		reset_control_deassert(rstc);
  1751	
  1752		reset_control_assert(rstc_ocp);
  1753		reset_control_deassert(rstc_ocp);
  1754	
  1755		cqspi->master_ref_clk_hz = clk_get_rate(cqspi->clk);
  1756		master->max_speed_hz = cqspi->master_ref_clk_hz;
  1757	
  1758		/* write completion is supported by default */
  1759		cqspi->wr_completion = true;
  1760	
  1761		ddata  = of_device_get_match_data(dev);
  1762		if (ddata) {
  1763			if (ddata->quirks & CQSPI_NEEDS_WR_DELAY)
  1764				cqspi->wr_delay = 50 * DIV_ROUND_UP(NSEC_PER_SEC,
  1765							cqspi->master_ref_clk_hz);
  1766			if (ddata->hwcaps_mask & CQSPI_SUPPORTS_OCTAL)
  1767				master->mode_bits |= SPI_RX_OCTAL | SPI_TX_OCTAL;
  1768			if (!(ddata->quirks & CQSPI_DISABLE_DAC_MODE)) {
  1769				cqspi->use_direct_mode = true;
  1770				cqspi->use_direct_mode_wr = true;
  1771			}
  1772			if (ddata->quirks & CQSPI_SUPPORT_EXTERNAL_DMA)
  1773				cqspi->use_dma_read = true;
  1774			if (ddata->quirks & CQSPI_NO_SUPPORT_WR_COMPLETION)
  1775				cqspi->wr_completion = false;
  1776			if (ddata->quirks & CQSPI_SLOW_SRAM)
  1777				cqspi->slow_sram = true;
  1778			if (ddata->quirks & CQSPI_NEEDS_APB_AHB_HAZARD_WAR)
  1779				cqspi->apb_ahb_hazard = true;
  1780	
  1781			if (of_device_is_compatible(pdev->dev.of_node,
  1782						    "xlnx,versal-ospi-1.0"))
  1783				dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
  1784		}
  1785	
  1786		ret = devm_request_irq(dev, irq, cqspi_irq_handler, 0,
  1787				       pdev->name, cqspi);
  1788		if (ret) {
  1789			dev_err(dev, "Cannot request IRQ.\n");
  1790			goto probe_reset_failed;
  1791		}
  1792	
  1793		cqspi_wait_idle(cqspi);
  1794		cqspi_controller_init(cqspi);
  1795		cqspi->current_cs = -1;
  1796		cqspi->sclk = 0;
  1797	
  1798		master->num_chipselect = cqspi->num_chipselect;
  1799	
  1800		ret = cqspi_setup_flash(cqspi);
  1801		if (ret) {
  1802			dev_err(dev, "failed to setup flash parameters %d\n", ret);
  1803			goto probe_setup_failed;
  1804		}
  1805	
  1806		if (cqspi->use_direct_mode) {
  1807			ret = cqspi_request_mmap_dma(cqspi);
  1808			if (ret == -EPROBE_DEFER)
  1809				goto probe_setup_failed;
  1810		}
  1811	
  1812		ret = spi_register_master(master);
  1813		if (ret) {
  1814			dev_err(&pdev->dev, "failed to register SPI ctlr %d\n", ret);
  1815			goto probe_setup_failed;
  1816		}
  1817	
  1818		return 0;
  1819	probe_setup_failed:
  1820		cqspi_controller_enable(cqspi, 0);
  1821	probe_reset_failed:
  1822		clk_disable_unprepare(cqspi->clk);
  1823	probe_clk_failed:
  1824		pm_runtime_put_sync(dev);
  1825	probe_pm_failed:
  1826		pm_runtime_disable(dev);
  1827		return ret;
  1828	}
  1829	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
