Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F86136348
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Aug 2024 06:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722666699; cv=none; b=CuVSEPo9HSj8TpZJR9A6mBAX43WLTHxtz2uKuA9jPcpWGCQ+h+dU0oBQ9SFAKYBYWq8d32+SBUbJRM8GS1WylQisYWUMsRgfJqZKWE5GRgbA/cGUZjBJdTUooEvqIG1oBAYxGXddKGEbz7rWTL09Y3rvv6qEpNJ55mEgwYRfeco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722666699; c=relaxed/simple;
	bh=8aaIfWOR8WzuCViNgfgth0apMbN8Ye55AWejT1244uM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rrin6NjL/YwF0TXbx0b/9T1GHo0lEAkOgU6YogUcodpoUIt8zqDS/76VUm8qd89vFx2Y+Ybz7YhYkwz7RF5ExrFxJ2V/LWRwdImlR8V3z1GUygcyTueqDglBH6hC/b7dtTW3icWoG5PX8XbkTmJkZH6EBPsQw/HdZrvAbxjmUwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IF+z0SsR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IF+z0SsR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722666697; x=1754202697;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8aaIfWOR8WzuCViNgfgth0apMbN8Ye55AWejT1244uM=;
  b=IF+z0SsRhUfsk3dI+2s47PQVyZQ0mb8mVtIuj5xQSJPQWnhP5nEwH/+z
   yaTRXTGdUxd+PSDTW8dd6UDovRftUCJJv0ITQNOUqyCcjcEq+xO2tDdXD
   ZBMq/J8OLd1DLjQuNsm/gExDvmu/TwTTV522dnyhG7UeZL4hX/u/uxYyH
   Db1CYzZH5xZFyUji5oDmSoBLoBfBnndHu6tcKksT7ZT1nALzs7teu175y
   gZzM3yVy6Djm+Mxyb467yCZIayaHQ5VUgaWQWj3gh9jZGrJxSuR5wzIuY
   S2finef1ZlPmAxf0ICdCspaPjl9yC9hRcP0jKRVfD1WvWFJuIomKyBsd7
   g==;
X-CSE-ConnectionGUID: y5EhpftVS4uLzwHL5+0VyA==
X-CSE-MsgGUID: i1vkupIbQ5uYiV3TdpVncw==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="31342445"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="31342445"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 23:31:30 -0700
X-CSE-ConnectionGUID: E678R97YSqCfaABVwbCMgA==
X-CSE-MsgGUID: yTIAao2aR2WzXvTUltv9uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="60651980"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 02 Aug 2024 23:31:29 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa8IY-0000BO-2Q;
	Sat, 03 Aug 2024 06:31:26 +0000
Date: Sat, 3 Aug 2024 14:31:15 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 1/3] firmware: ti_sci: Introduce Power Management Ops
Message-ID: <202408031302.28NpPykP-lkp@intel.com>
References: <20240801195422.2296347-2-msp@baylibre.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801195422.2296347-2-msp@baylibre.com>

Hi Markus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v6.11-rc1 next-20240802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Schneider-Pargmann/firmware-ti_sci-Introduce-Power-Management-Ops/20240803-041746
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20240801195422.2296347-2-msp%40baylibre.com
patch subject: [PATCH v8 1/3] firmware: ti_sci: Introduce Power Management Ops
config: arm-keystone_defconfig (https://download.01.org/0day-ci/archive/20240803/202408031302.28NpPykP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031302.28NpPykP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408031302.28NpPykP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/ti_sci.c:1886:12: warning: 'ti_sci_cmd_set_latency_constraint' defined but not used [-Wunused-function]
    1886 | static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/ti_sci.c:1832:12: warning: 'ti_sci_cmd_set_device_constraint' defined but not used [-Wunused-function]
    1832 | static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/firmware/ti_sci.c:1779:12: warning: 'ti_sci_cmd_set_io_isolation' defined but not used [-Wunused-function]
    1779 | static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/firmware/ti_sci.c:1664:12: warning: 'ti_sci_cmd_prepare_sleep' defined but not used [-Wunused-function]
    1664 | static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/ti_sci_cmd_set_io_isolation +1779 drivers/firmware/ti_sci.c

  1653	
  1654	/**
  1655	 * ti_sci_cmd_prepare_sleep() - Prepare system for system suspend
  1656	 * @handle:		pointer to TI SCI handle
  1657	 * @mode:		Device identifier
  1658	 * @ctx_lo:		Low part of address for context save
  1659	 * @ctx_hi:		High part of address for context save
  1660	 * @debug_flags:	Debug flags to pass to firmware
  1661	 *
  1662	 * Return: 0 if all went well, else returns appropriate error value.
  1663	 */
> 1664	static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
  1665					    u32 ctx_lo, u32 ctx_hi, u32 debug_flags)
  1666	{
  1667		struct ti_sci_info *info;
  1668		struct ti_sci_msg_req_prepare_sleep *req;
  1669		struct ti_sci_msg_hdr *resp;
  1670		struct ti_sci_xfer *xfer;
  1671		struct device *dev;
  1672		int ret = 0;
  1673	
  1674		if (IS_ERR(handle))
  1675			return PTR_ERR(handle);
  1676		if (!handle)
  1677			return -EINVAL;
  1678	
  1679		info = handle_to_ti_sci_info(handle);
  1680		dev = info->dev;
  1681	
  1682		xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PREPARE_SLEEP,
  1683					   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
  1684					   sizeof(*req), sizeof(*resp));
  1685		if (IS_ERR(xfer)) {
  1686			ret = PTR_ERR(xfer);
  1687			dev_err(dev, "Message alloc failed(%d)\n", ret);
  1688			return ret;
  1689		}
  1690	
  1691		req = (struct ti_sci_msg_req_prepare_sleep *)xfer->xfer_buf;
  1692		req->mode = mode;
  1693		req->ctx_lo = ctx_lo;
  1694		req->ctx_hi = ctx_hi;
  1695		req->debug_flags = debug_flags;
  1696	
  1697		ret = ti_sci_do_xfer(info, xfer);
  1698		if (ret) {
  1699			dev_err(dev, "Mbox send fail %d\n", ret);
  1700			goto fail;
  1701		}
  1702	
  1703		resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
  1704	
  1705		ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
  1706	
  1707	fail:
  1708		ti_sci_put_one_xfer(&info->minfo, xfer);
  1709	
  1710		return ret;
  1711	}
  1712	
  1713	/**
  1714	 * ti_sci_msg_cmd_lpm_wake_reason() - Get the wakeup source from LPM
  1715	 * @handle:		Pointer to TI SCI handle
  1716	 * @source:		The wakeup source that woke the SoC from LPM
  1717	 * @timestamp:		Timestamp of the wakeup event
  1718	 *
  1719	 * Return: 0 if all went well, else returns appropriate error value.
  1720	 */
  1721	static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
  1722						  u32 *source, u64 *timestamp)
  1723	{
  1724		struct ti_sci_info *info;
  1725		struct ti_sci_xfer *xfer;
  1726		struct ti_sci_msg_resp_lpm_wake_reason *resp;
  1727		struct device *dev;
  1728		int ret = 0;
  1729	
  1730		if (IS_ERR(handle))
  1731			return PTR_ERR(handle);
  1732		if (!handle)
  1733			return -EINVAL;
  1734	
  1735		info = handle_to_ti_sci_info(handle);
  1736		dev = info->dev;
  1737	
  1738		xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_WAKE_REASON,
  1739					   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
  1740					   sizeof(struct ti_sci_msg_hdr),
  1741					   sizeof(*resp));
  1742		if (IS_ERR(xfer)) {
  1743			ret = PTR_ERR(xfer);
  1744			dev_err(dev, "Message alloc failed(%d)\n", ret);
  1745			return ret;
  1746		}
  1747	
  1748		ret = ti_sci_do_xfer(info, xfer);
  1749		if (ret) {
  1750			dev_err(dev, "Mbox send fail %d\n", ret);
  1751			goto fail;
  1752		}
  1753	
  1754		resp = (struct ti_sci_msg_resp_lpm_wake_reason *)xfer->xfer_buf;
  1755	
  1756		if (!ti_sci_is_response_ack(resp)) {
  1757			ret = -ENODEV;
  1758			goto fail;
  1759		}
  1760	
  1761		if (source)
  1762			*source = resp->wake_source;
  1763		if (timestamp)
  1764			*timestamp = resp->wake_timestamp;
  1765	
  1766	fail:
  1767		ti_sci_put_one_xfer(&info->minfo, xfer);
  1768	
  1769		return ret;
  1770	}
  1771	
  1772	/**
  1773	 * ti_sci_cmd_set_io_isolation() - Enable IO isolation in LPM
  1774	 * @handle:		Pointer to TI SCI handle
  1775	 * @state:		The desired state of the IO isolation
  1776	 *
  1777	 * Return: 0 if all went well, else returns appropriate error value.
  1778	 */
> 1779	static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
  1780					       u8 state)
  1781	{
  1782		struct ti_sci_info *info;
  1783		struct ti_sci_msg_req_set_io_isolation *req;
  1784		struct ti_sci_msg_hdr *resp;
  1785		struct ti_sci_xfer *xfer;
  1786		struct device *dev;
  1787		int ret = 0;
  1788	
  1789		if (IS_ERR(handle))
  1790			return PTR_ERR(handle);
  1791		if (!handle)
  1792			return -EINVAL;
  1793	
  1794		info = handle_to_ti_sci_info(handle);
  1795		dev = info->dev;
  1796	
  1797		xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_IO_ISOLATION,
  1798					   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
  1799					   sizeof(*req), sizeof(*resp));
  1800		if (IS_ERR(xfer)) {
  1801			ret = PTR_ERR(xfer);
  1802			dev_err(dev, "Message alloc failed(%d)\n", ret);
  1803			return ret;
  1804		}
  1805		req = (struct ti_sci_msg_req_set_io_isolation *)xfer->xfer_buf;
  1806		req->state = state;
  1807	
  1808		ret = ti_sci_do_xfer(info, xfer);
  1809		if (ret) {
  1810			dev_err(dev, "Mbox send fail %d\n", ret);
  1811			goto fail;
  1812		}
  1813	
  1814		resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
  1815	
  1816		ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
  1817	
  1818	fail:
  1819		ti_sci_put_one_xfer(&info->minfo, xfer);
  1820	
  1821		return ret;
  1822	}
  1823	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
