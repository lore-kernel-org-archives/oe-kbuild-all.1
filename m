Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C5B4416
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 03:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F3R9I95U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699241074; x=1730777074;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=knVmwRTH2zU/yCMfn4SLXb1218dQrDUmUShMax3R284=;
  b=F3R9I95USkIE6/bBbt4JlFCNdcnPd7mY5o8I+3lI2ZUHmAppKQ/RKi7J
   ik3k/mteiNuuU5dyIlxCCOoGcpJChbOZb3wQEFwKJxoru6NaboFVrMwmi
   PvMZLPZKqHSbzH/8+lJNq4fs822sEI5AMPMmuOXMGGN5gyahHL7b4XBOX
   y8Qy8lE6h4uum3plBsM8zsdpbL49Pt0FX1INtsLn4ZF5CUshXBEdZRRyb
   R5kSWleTvHA940z6ITShb7nCSxuTEf0M69kRx25HQmVRm72Okedxbv+w3
   Pu+qQ3ooXPEzkN4pMIzGt4jZiDXSqtJKEPwzWMB7N3KspTzslaKNZx2CX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379591721"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="379591721"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 19:24:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="738673509"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="738673509"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 05 Nov 2023 19:24:32 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzqE2-00064G-0g;
	Mon, 06 Nov 2023 03:24:30 +0000
Date: Mon, 6 Nov 2023 11:23:39 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [hverkuil-media-tree:hdmi-dbg 22/33] htmldocs:
 ./include/drm/drm_connector.h:1948: warning: Function parameter or member
 'hdmi' not described in 'drm_connector'
Message-ID: <202311061115.HqbOPYPS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   git://linuxtv.org/hverkuil/media_tree.git hdmi-dbg
head:   8e65f28447c830fe113ba037c2ba210d781d4420
commit: 118b1876a2cb936b34e100d60412932b0369be7d [22/33] drm/connector: hdmi: Add support for output format
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311061115.HqbOPYPS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311061115.HqbOPYPS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/drm/drm_connector.h:1948: warning: Function parameter or member 'hdmi' not described in 'drm_connector'

vim +1948 ./include/drm/drm_connector.h

52217195176115 Daniel Vetter         2016-08-12  1756  
ae2a6da8762985 Daniel Vetter         2016-08-12  1757  	/**
ae2a6da8762985 Daniel Vetter         2016-08-12  1758  	 * @polled:
ae2a6da8762985 Daniel Vetter         2016-08-12  1759  	 *
ae2a6da8762985 Daniel Vetter         2016-08-12  1760  	 * Connector polling mode, a combination of
ae2a6da8762985 Daniel Vetter         2016-08-12  1761  	 *
ae2a6da8762985 Daniel Vetter         2016-08-12  1762  	 * DRM_CONNECTOR_POLL_HPD
ae2a6da8762985 Daniel Vetter         2016-08-12  1763  	 *     The connector generates hotplug events and doesn't need to be
ae2a6da8762985 Daniel Vetter         2016-08-12  1764  	 *     periodically polled. The CONNECT and DISCONNECT flags must not
ae2a6da8762985 Daniel Vetter         2016-08-12  1765  	 *     be set together with the HPD flag.
ae2a6da8762985 Daniel Vetter         2016-08-12  1766  	 *
ae2a6da8762985 Daniel Vetter         2016-08-12  1767  	 * DRM_CONNECTOR_POLL_CONNECT
ae2a6da8762985 Daniel Vetter         2016-08-12  1768  	 *     Periodically poll the connector for connection.
ae2a6da8762985 Daniel Vetter         2016-08-12  1769  	 *
ae2a6da8762985 Daniel Vetter         2016-08-12  1770  	 * DRM_CONNECTOR_POLL_DISCONNECT
92e1d26324e095 Daniel Vetter         2018-07-09  1771  	 *     Periodically poll the connector for disconnection, without
92e1d26324e095 Daniel Vetter         2018-07-09  1772  	 *     causing flickering even when the connector is in use. DACs should
92e1d26324e095 Daniel Vetter         2018-07-09  1773  	 *     rarely do this without a lot of testing.
ae2a6da8762985 Daniel Vetter         2016-08-12  1774  	 *
ae2a6da8762985 Daniel Vetter         2016-08-12  1775  	 * Set to 0 for connectors that don't support connection status
ae2a6da8762985 Daniel Vetter         2016-08-12  1776  	 * discovery.
ae2a6da8762985 Daniel Vetter         2016-08-12  1777  	 */
ae2a6da8762985 Daniel Vetter         2016-08-12  1778  	uint8_t polled;
52217195176115 Daniel Vetter         2016-08-12  1779  
92e1d26324e095 Daniel Vetter         2018-07-09  1780  	/**
92e1d26324e095 Daniel Vetter         2018-07-09  1781  	 * @dpms: Current dpms state. For legacy drivers the
92e1d26324e095 Daniel Vetter         2018-07-09  1782  	 * &drm_connector_funcs.dpms callback must update this. For atomic
92e1d26324e095 Daniel Vetter         2018-07-09  1783  	 * drivers, this is handled by the core atomic code, and drivers must
92e1d26324e095 Daniel Vetter         2018-07-09  1784  	 * only take &drm_crtc_state.active into account.
92e1d26324e095 Daniel Vetter         2018-07-09  1785  	 */
52217195176115 Daniel Vetter         2016-08-12  1786  	int dpms;
52217195176115 Daniel Vetter         2016-08-12  1787  
92e1d26324e095 Daniel Vetter         2018-07-09  1788  	/** @helper_private: mid-layer private data */
52217195176115 Daniel Vetter         2016-08-12  1789  	const struct drm_connector_helper_funcs *helper_private;
52217195176115 Daniel Vetter         2016-08-12  1790  
92e1d26324e095 Daniel Vetter         2018-07-09  1791  	/** @cmdline_mode: mode line parsed from the kernel cmdline for this connector */
52217195176115 Daniel Vetter         2016-08-12  1792  	struct drm_cmdline_mode cmdline_mode;
92e1d26324e095 Daniel Vetter         2018-07-09  1793  	/** @force: a DRM_FORCE_<foo> state for forced mode sets */
52217195176115 Daniel Vetter         2016-08-12  1794  	enum drm_connector_force force;
90b575f52c6ab3 Jani Nikula           2022-10-24  1795  
90b575f52c6ab3 Jani Nikula           2022-10-24  1796  	/**
90b575f52c6ab3 Jani Nikula           2022-10-24  1797  	 * @edid_override: Override EDID set via debugfs.
90b575f52c6ab3 Jani Nikula           2022-10-24  1798  	 *
90b575f52c6ab3 Jani Nikula           2022-10-24  1799  	 * Do not modify or access outside of the drm_edid_override_* family of
90b575f52c6ab3 Jani Nikula           2022-10-24  1800  	 * functions.
90b575f52c6ab3 Jani Nikula           2022-10-24  1801  	 */
90b575f52c6ab3 Jani Nikula           2022-10-24  1802  	const struct drm_edid *edid_override;
90b575f52c6ab3 Jani Nikula           2022-10-24  1803  
6aa145bc943d34 Jani Nikula           2022-06-29  1804  	/**
90b575f52c6ab3 Jani Nikula           2022-10-24  1805  	 * @edid_override_mutex: Protect access to edid_override.
6aa145bc943d34 Jani Nikula           2022-06-29  1806  	 */
90b575f52c6ab3 Jani Nikula           2022-10-24  1807  	struct mutex edid_override_mutex;
90b575f52c6ab3 Jani Nikula           2022-10-24  1808  
5186421cbfe250 Stanislav Lisovskiy   2020-06-30  1809  	/** @epoch_counter: used to detect any other changes in connector, besides status */
5186421cbfe250 Stanislav Lisovskiy   2020-06-30  1810  	u64 epoch_counter;
52217195176115 Daniel Vetter         2016-08-12  1811  
92e1d26324e095 Daniel Vetter         2018-07-09  1812  	/**
62afb4ad425af2 José Roberto de Souza 2019-09-13  1813  	 * @possible_encoders: Bit mask of encoders that can drive this
62afb4ad425af2 José Roberto de Souza 2019-09-13  1814  	 * connector, drm_encoder_index() determines the index into the bitfield
62afb4ad425af2 José Roberto de Souza 2019-09-13  1815  	 * and the bits are set with drm_connector_attach_encoder().
92e1d26324e095 Daniel Vetter         2018-07-09  1816  	 */
62afb4ad425af2 José Roberto de Souza 2019-09-13  1817  	u32 possible_encoders;
92e1d26324e095 Daniel Vetter         2018-07-09  1818  
2e2b96ef7a9b71 Daniel Vetter         2017-11-08  1819  	/**
2e2b96ef7a9b71 Daniel Vetter         2017-11-08  1820  	 * @encoder: Currently bound encoder driving this connector, if any.
2e2b96ef7a9b71 Daniel Vetter         2017-11-08  1821  	 * Only really meaningful for non-atomic drivers. Atomic drivers should
2e2b96ef7a9b71 Daniel Vetter         2017-11-08  1822  	 * instead look at &drm_connector_state.best_encoder, and in case they
2e2b96ef7a9b71 Daniel Vetter         2017-11-08  1823  	 * need the CRTC driving this output, &drm_connector_state.crtc.
2e2b96ef7a9b71 Daniel Vetter         2017-11-08  1824  	 */
2e2b96ef7a9b71 Daniel Vetter         2017-11-08  1825  	struct drm_encoder *encoder;
52217195176115 Daniel Vetter         2016-08-12  1826  
52217195176115 Daniel Vetter         2016-08-12  1827  #define MAX_ELD_BYTES	128
92e1d26324e095 Daniel Vetter         2018-07-09  1828  	/** @eld: EDID-like data, if present */
52217195176115 Daniel Vetter         2016-08-12  1829  	uint8_t eld[MAX_ELD_BYTES];
92e1d26324e095 Daniel Vetter         2018-07-09  1830  	/** @latency_present: AV delay info from ELD, if found */
52217195176115 Daniel Vetter         2016-08-12  1831  	bool latency_present[2];
92e1d26324e095 Daniel Vetter         2018-07-09  1832  	/**
92e1d26324e095 Daniel Vetter         2018-07-09  1833  	 * @video_latency: Video latency info from ELD, if found.
92e1d26324e095 Daniel Vetter         2018-07-09  1834  	 * [0]: progressive, [1]: interlaced
92e1d26324e095 Daniel Vetter         2018-07-09  1835  	 */
92e1d26324e095 Daniel Vetter         2018-07-09  1836  	int video_latency[2];
92e1d26324e095 Daniel Vetter         2018-07-09  1837  	/**
92e1d26324e095 Daniel Vetter         2018-07-09  1838  	 * @audio_latency: audio latency info from ELD, if found
92e1d26324e095 Daniel Vetter         2018-07-09  1839  	 * [0]: progressive, [1]: interlaced
92e1d26324e095 Daniel Vetter         2018-07-09  1840  	 */
52217195176115 Daniel Vetter         2016-08-12  1841  	int audio_latency[2];
e1a29c6c59553d Andrzej Pietrasiewicz 2019-07-26  1842  
e1a29c6c59553d Andrzej Pietrasiewicz 2019-07-26  1843  	/**
e1a29c6c59553d Andrzej Pietrasiewicz 2019-07-26  1844  	 * @ddc: associated ddc adapter.
e1a29c6c59553d Andrzej Pietrasiewicz 2019-07-26  1845  	 * A connector usually has its associated ddc adapter. If a driver uses
e1a29c6c59553d Andrzej Pietrasiewicz 2019-07-26  1846  	 * this field, then an appropriate symbolic link is created in connector
e1a29c6c59553d Andrzej Pietrasiewicz 2019-07-26  1847  	 * sysfs directory to make it easy for the user to tell which i2c
e1a29c6c59553d Andrzej Pietrasiewicz 2019-07-26  1848  	 * adapter is for a particular display.
100163df420305 Andrzej Pietrasiewicz 2019-07-26  1849  	 *
100163df420305 Andrzej Pietrasiewicz 2019-07-26  1850  	 * The field should be set by calling drm_connector_init_with_ddc().
e1a29c6c59553d Andrzej Pietrasiewicz 2019-07-26  1851  	 */
e1a29c6c59553d Andrzej Pietrasiewicz 2019-07-26  1852  	struct i2c_adapter *ddc;
e1a29c6c59553d Andrzej Pietrasiewicz 2019-07-26  1853  
92e1d26324e095 Daniel Vetter         2018-07-09  1854  	/**
92e1d26324e095 Daniel Vetter         2018-07-09  1855  	 * @null_edid_counter: track sinks that give us all zeros for the EDID.
92e1d26324e095 Daniel Vetter         2018-07-09  1856  	 * Needed to workaround some HW bugs where we get all 0s
92e1d26324e095 Daniel Vetter         2018-07-09  1857  	 */
92e1d26324e095 Daniel Vetter         2018-07-09  1858  	int null_edid_counter;
92e1d26324e095 Daniel Vetter         2018-07-09  1859  
92e1d26324e095 Daniel Vetter         2018-07-09  1860  	/** @bad_edid_counter: track sinks that give us an EDID with invalid checksum */
52217195176115 Daniel Vetter         2016-08-12  1861  	unsigned bad_edid_counter;
52217195176115 Daniel Vetter         2016-08-12  1862  
92e1d26324e095 Daniel Vetter         2018-07-09  1863  	/**
92e1d26324e095 Daniel Vetter         2018-07-09  1864  	 * @edid_corrupt: Indicates whether the last read EDID was corrupt. Used
92e1d26324e095 Daniel Vetter         2018-07-09  1865  	 * in Displayport compliance testing - Displayport Link CTS Core 1.2
92e1d26324e095 Daniel Vetter         2018-07-09  1866  	 * rev1.1 4.2.2.6
52217195176115 Daniel Vetter         2016-08-12  1867  	 */
52217195176115 Daniel Vetter         2016-08-12  1868  	bool edid_corrupt;
e11f5bd8228fc3 Jerry (Fangzhi  Zuo   2020-02-11  1869) 	/**
e11f5bd8228fc3 Jerry (Fangzhi  Zuo   2020-02-11  1870) 	 * @real_edid_checksum: real edid checksum for corrupted edid block.
e11f5bd8228fc3 Jerry (Fangzhi  Zuo   2020-02-11  1871) 	 * Required in Displayport 1.4 compliance testing
e11f5bd8228fc3 Jerry (Fangzhi  Zuo   2020-02-11  1872) 	 * rev1.1 4.2.2.6
e11f5bd8228fc3 Jerry (Fangzhi  Zuo   2020-02-11  1873) 	 */
e11f5bd8228fc3 Jerry (Fangzhi  Zuo   2020-02-11  1874) 	u8 real_edid_checksum;
52217195176115 Daniel Vetter         2016-08-12  1875  
92e1d26324e095 Daniel Vetter         2018-07-09  1876  	/** @debugfs_entry: debugfs directory for this connector */
52217195176115 Daniel Vetter         2016-08-12  1877  	struct dentry *debugfs_entry;
52217195176115 Daniel Vetter         2016-08-12  1878  
c9e42b72b44acc Daniel Vetter         2017-03-28  1879  	/**
c9e42b72b44acc Daniel Vetter         2017-03-28  1880  	 * @state:
c9e42b72b44acc Daniel Vetter         2017-03-28  1881  	 *
c9e42b72b44acc Daniel Vetter         2017-03-28  1882  	 * Current atomic state for this connector.
c9e42b72b44acc Daniel Vetter         2017-03-28  1883  	 *
92e1d26324e095 Daniel Vetter         2018-07-09  1884  	 * This is protected by &drm_mode_config.connection_mutex. Note that
c9e42b72b44acc Daniel Vetter         2017-03-28  1885  	 * nonblocking atomic commits access the current connector state without
c9e42b72b44acc Daniel Vetter         2017-03-28  1886  	 * taking locks. Either by going through the &struct drm_atomic_state
77ac3b00b13185 Maarten Lankhorst     2017-07-19  1887  	 * pointers, see for_each_oldnew_connector_in_state(),
c9e42b72b44acc Daniel Vetter         2017-03-28  1888  	 * for_each_old_connector_in_state() and
c9e42b72b44acc Daniel Vetter         2017-03-28  1889  	 * for_each_new_connector_in_state(). Or through careful ordering of
c9e42b72b44acc Daniel Vetter         2017-03-28  1890  	 * atomic commit operations as implemented in the atomic helpers, see
c9e42b72b44acc Daniel Vetter         2017-03-28  1891  	 * &struct drm_crtc_commit.
c9e42b72b44acc Daniel Vetter         2017-03-28  1892  	 */
52217195176115 Daniel Vetter         2016-08-12  1893  	struct drm_connector_state *state;
52217195176115 Daniel Vetter         2016-08-12  1894  
92e1d26324e095 Daniel Vetter         2018-07-09  1895  	/* DisplayID bits. FIXME: Extract into a substruct? */
92e1d26324e095 Daniel Vetter         2018-07-09  1896  
92e1d26324e095 Daniel Vetter         2018-07-09  1897  	/**
92e1d26324e095 Daniel Vetter         2018-07-09  1898  	 * @tile_blob_ptr:
92e1d26324e095 Daniel Vetter         2018-07-09  1899  	 *
92e1d26324e095 Daniel Vetter         2018-07-09  1900  	 * DRM blob property data for the tile property (used mostly by DP MST).
92e1d26324e095 Daniel Vetter         2018-07-09  1901  	 * This is meant for screens which are driven through separate display
92e1d26324e095 Daniel Vetter         2018-07-09  1902  	 * pipelines represented by &drm_crtc, which might not be running with
92e1d26324e095 Daniel Vetter         2018-07-09  1903  	 * genlocked clocks. For tiled panels which are genlocked, like
92e1d26324e095 Daniel Vetter         2018-07-09  1904  	 * dual-link LVDS or dual-link DSI, the driver should try to not expose
92e1d26324e095 Daniel Vetter         2018-07-09  1905  	 * the tiling and virtualize both &drm_crtc and &drm_plane if needed.
92e1d26324e095 Daniel Vetter         2018-07-09  1906  	 *
92e1d26324e095 Daniel Vetter         2018-07-09  1907  	 * This should only be updated by calling
97e14fbeb53fe0 Daniel Vetter         2018-07-09  1908  	 * drm_connector_set_tile_property().
92e1d26324e095 Daniel Vetter         2018-07-09  1909  	 */
92e1d26324e095 Daniel Vetter         2018-07-09  1910  	struct drm_property_blob *tile_blob_ptr;
92e1d26324e095 Daniel Vetter         2018-07-09  1911  
92e1d26324e095 Daniel Vetter         2018-07-09  1912  	/** @has_tile: is this connector connected to a tiled monitor */
52217195176115 Daniel Vetter         2016-08-12  1913  	bool has_tile;
92e1d26324e095 Daniel Vetter         2018-07-09  1914  	/** @tile_group: tile group for the connected monitor */
52217195176115 Daniel Vetter         2016-08-12  1915  	struct drm_tile_group *tile_group;
92e1d26324e095 Daniel Vetter         2018-07-09  1916  	/** @tile_is_single_monitor: whether the tile is one monitor housing */
52217195176115 Daniel Vetter         2016-08-12  1917  	bool tile_is_single_monitor;
52217195176115 Daniel Vetter         2016-08-12  1918  
92e1d26324e095 Daniel Vetter         2018-07-09  1919  	/** @num_h_tile: number of horizontal tiles in the tile group */
92e1d26324e095 Daniel Vetter         2018-07-09  1920  	/** @num_v_tile: number of vertical tiles in the tile group */
52217195176115 Daniel Vetter         2016-08-12  1921  	uint8_t num_h_tile, num_v_tile;
92e1d26324e095 Daniel Vetter         2018-07-09  1922  	/** @tile_h_loc: horizontal location of this tile */
92e1d26324e095 Daniel Vetter         2018-07-09  1923  	/** @tile_v_loc: vertical location of this tile */
52217195176115 Daniel Vetter         2016-08-12  1924  	uint8_t tile_h_loc, tile_v_loc;
92e1d26324e095 Daniel Vetter         2018-07-09  1925  	/** @tile_h_size: horizontal size of this tile. */
92e1d26324e095 Daniel Vetter         2018-07-09  1926  	/** @tile_v_size: vertical size of this tile. */
52217195176115 Daniel Vetter         2016-08-12  1927  	uint16_t tile_h_size, tile_v_size;
a703c55004e1c5 Daniel Vetter         2017-12-04  1928  
a703c55004e1c5 Daniel Vetter         2017-12-04  1929  	/**
ea497bb9206487 Daniel Vetter         2017-12-13  1930  	 * @free_node:
a703c55004e1c5 Daniel Vetter         2017-12-04  1931  	 *
92e1d26324e095 Daniel Vetter         2018-07-09  1932  	 * List used only by &drm_connector_list_iter to be able to clean up a
ea497bb9206487 Daniel Vetter         2017-12-13  1933  	 * connector from any context, in conjunction with
ea497bb9206487 Daniel Vetter         2017-12-13  1934  	 * &drm_mode_config.connector_free_work.
a703c55004e1c5 Daniel Vetter         2017-12-04  1935  	 */
ea497bb9206487 Daniel Vetter         2017-12-13  1936  	struct llist_node free_node;
fbb5d0353c62d1 Uma Shankar           2019-05-16  1937  
a09db883e5d938 Uma Shankar           2019-06-04  1938  	/** @hdr_sink_metadata: HDR Metadata Information read from sink */
fbb5d0353c62d1 Uma Shankar           2019-05-16  1939  	struct hdr_sink_metadata hdr_sink_metadata;
118b1876a2cb93 Maxime Ripard         2023-10-31  1940  
118b1876a2cb93 Maxime Ripard         2023-10-31  1941  	struct {
118b1876a2cb93 Maxime Ripard         2023-10-31  1942  		/**
118b1876a2cb93 Maxime Ripard         2023-10-31  1943  		 * @supported_formats: Bitmask of @hdmi_colorspace
118b1876a2cb93 Maxime Ripard         2023-10-31  1944  		 * supported by the controller.
118b1876a2cb93 Maxime Ripard         2023-10-31  1945  		 */
118b1876a2cb93 Maxime Ripard         2023-10-31  1946  		unsigned long supported_formats;
118b1876a2cb93 Maxime Ripard         2023-10-31  1947  	} hdmi;
52217195176115 Daniel Vetter         2016-08-12 @1948  };
52217195176115 Daniel Vetter         2016-08-12  1949  

:::::: The code at line 1948 was first introduced by commit
:::::: 522171951761153172c75b94ae1f4bc9ab631745 drm: Extract drm_connector.[hc]

:::::: TO: Daniel Vetter <daniel.vetter@ffwll.ch>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
