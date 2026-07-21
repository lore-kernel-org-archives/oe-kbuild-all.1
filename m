Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9282D94A0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jul 2026 03:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784605800; cv=none; b=lbozv70VcuUUzBTkO8rXs/68wnJ5XKSGxqF/+ed6Qb6thS0NOWBYyRjU0hIv1zjKoMC/F8CXfpOdDTQiiCgiMkp9qExn+mXEAYnflooVqIWBoNsV5cLTTri7N7JuCYHsyNh4cmd5+kzD1gX4Qr6MOJmUpWE2J026nUsVqT4zAjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784605800; c=relaxed/simple;
	bh=o4wkF+QRQmCfgUzUZHPkTP5f5hh1D0CpVY0gpttGQ3o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E4Qw6xYoTGvoG2ECu0xQb7wGYPThbbYrGfBdHZjwh7mXm7h5082KaPHsCh+YXBooNY7F1SIgzhymXfbZKraCqjQrIr9OededDUWz7vtMpdyRkOScnMelGsSnwKmFtmI0HdCo8WKsbl3WNkjd+O9XzWprA6rbJbNPOO06NBkhl1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kehta58/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kehta58/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784605798; x=1816141798;
  h=date:from:to:cc:subject:message-id;
  bh=o4wkF+QRQmCfgUzUZHPkTP5f5hh1D0CpVY0gpttGQ3o=;
  b=Kehta58/i32Ml+OvIRhLfekT/m4YfvGd8+AGLix8TnK6mlEmR6/Nk4ex
   vIihdK/pyZuQEJWha7VlT5AlUw0Hm7OxvB57DexkA2qG3INfduolyyD37
   Uowq9W6JEKqVmGHQ19QPx7MifrEBv8XLjHDqkMIBCCVTMh23ithILGiZY
   MIZ3e+VDn7PQbrX9iLIm1YL/1le0eiY7EEIQyjEodIKaQsOXsVuP66MSm
   XeDWsMMWRr4exU8z86NEzPW6OInpfIw4IUtlSHg2MJkQn+UPblb4jn4HX
   YSvPHsiUOSlGwjKSXe6AFPIlFc92qwz3yK3Ypbbia5WjxsMtsmbNWloI3
   Q==;
X-CSE-ConnectionGUID: xSuXAWydSxyuc92a9zR40A==
X-CSE-MsgGUID: wR0gZJ1TSVGUmlnQBYZn8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85315450"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; 
   d="scan'208";a="85315450"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 20:49:57 -0700
X-CSE-ConnectionGUID: +BHi/PL0Qs2uV3SPOzoA9Q==
X-CSE-MsgGUID: V7WjEom4Szy/MstsCXy7Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; 
   d="scan'208";a="256434027"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 20 Jul 2026 20:49:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wm1UP-00000000XCX-0dzp;
	Tue, 21 Jul 2026 03:49:53 +0000
Date: Tue, 21 Jul 2026 11:49:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 69/69]
 drivers/gpu/drm/mediatek/mtk_crtc.c:2029:29: error: no member named
 'fast_modeset_done' in 'struct mtk_crtc'
Message-ID: <202607211148.PQjSRJkn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   5c224965e126381df8ede667d64af990b76f1b46
commit: d987a15a211de927eda62988be34f608ebeed65e [69/69] CHROMIUM: drm/mediatek: Fix spurious wakeup causing black screen
config: arm-randconfig-001-20260721 (https://download.01.org/0day-ci/archive/20260721/202607211148.PQjSRJkn-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0dfced1adc55429e32b1db08570abd3a219d85)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260721/202607211148.PQjSRJkn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607211148.PQjSRJkn-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_crtc.c:597:25: warning: variable 'state' set but not used [-Wunused-but-set-variable]
     597 |         struct mtk_crtc_state *state;
         |                                ^
   drivers/gpu/drm/mediatek/mtk_crtc.c:1649:19: error: no member named 'cmdq_client' in 'struct mtk_crtc'
    1649 |                         if (!mtk_crtc->cmdq_client.chan)
         |                              ~~~~~~~~  ^
   drivers/gpu/drm/mediatek/mtk_crtc.c:1656:5: warning: no previous prototype for function 'mtk_crtc_atomic_check' [-Wmissing-prototypes]
    1656 | int mtk_crtc_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
         |     ^
   drivers/gpu/drm/mediatek/mtk_crtc.c:1656:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1656 | int mtk_crtc_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
         | ^
         | static 
>> drivers/gpu/drm/mediatek/mtk_crtc.c:2029:29: error: no member named 'fast_modeset_done' in 'struct mtk_crtc'
    2029 |         init_completion(&mtk_crtc->fast_modeset_done);
         |                          ~~~~~~~~  ^
   2 warnings and 2 errors generated.


vim +2029 drivers/gpu/drm/mediatek/mtk_crtc.c

  1813	
  1814	int mtk_crtc_create(struct drm_device *drm_dev, enum mtk_crtc_path path_sel)
  1815	{
  1816		struct mtk_drm_private *priv = drm_dev->dev_private;
  1817		struct device *dev = drm_dev->dev;
  1818		struct mtk_crtc *mtk_crtc;
  1819		unsigned int num_comp_planes = 0;
  1820		int ret;
  1821		int i, j, k;
  1822		bool has_ctm = false;
  1823		uint gamma_lut_size = 0;
  1824		struct drm_crtc *tmp;
  1825		int crtc_i = 0;
  1826		struct mtk_drm_private *subsys_priv;
  1827		struct mtk_crtc_comp_info path[DDP_COMPONENT_ID_MAX];
  1828		unsigned int path_len = 0;
  1829		const struct mtk_drm_route *conn_routes = NULL;
  1830		unsigned int num_conn_routes = 0;
  1831		enum mtk_drm_mmsys conn_mmsys;
  1832	
  1833		drm_for_each_crtc(tmp, drm_dev)
  1834			crtc_i++;
  1835	
  1836		for (j = 0; j < priv->data->mmsys_dev_num; j++) {
  1837			for (k = 0; k < MAX_MMSYS; k++) {
  1838				const unsigned int *subsys_path;
  1839				unsigned int subsys_path_len = 0;
  1840				unsigned int order = 0;
  1841	
  1842				subsys_priv = priv->all_drm_private[k];
  1843				if (!subsys_priv)
  1844					continue;
  1845	
  1846				if (path_sel == CRTC_MAIN) {
  1847					subsys_path = subsys_priv->data->main_path;
  1848					subsys_path_len = subsys_priv->data->main_len;
  1849					order = subsys_priv->data->main_order;
  1850				} else if (path_sel == CRTC_EXT) {
  1851					subsys_path = subsys_priv->data->ext_path;
  1852					subsys_path_len = subsys_priv->data->ext_len;
  1853					order = subsys_priv->data->ext_order;
  1854				} else if (path_sel == CRTC_THIRD) {
  1855					subsys_path = subsys_priv->data->third_path;
  1856					subsys_path_len = subsys_priv->data->third_len;
  1857					order = subsys_priv->data->third_order;
  1858				}
  1859	
  1860				if (subsys_priv->data->num_conn_routes) {
  1861					conn_routes = subsys_priv->data->conn_routes;
  1862					num_conn_routes = subsys_priv->data->num_conn_routes;
  1863					conn_mmsys = subsys_priv->data->mmsys_id;
  1864				}
  1865	
  1866				if (j != order)
  1867					continue;
  1868				if (!subsys_path_len)
  1869					continue;
  1870	
  1871				for (i = 0; i < subsys_path_len; i++) {
  1872					path[path_len].sys = subsys_priv->data->mmsys_id;
  1873					path[path_len].comp_id = subsys_path[i];
  1874					path_len++;
  1875				}
  1876			}
  1877		}
  1878	
  1879		if (!path_len)
  1880			return 0;
  1881	
  1882		if (num_conn_routes) {
  1883			for (i = 0; i < num_conn_routes; i++)
  1884				if (conn_routes->crtc_id == crtc_i)
  1885					break;
  1886			if (i == num_conn_routes) {
  1887				num_conn_routes = 0;
  1888				conn_routes = NULL;
  1889			}
  1890		}
  1891	
  1892		for (i = 0; i < path_len; i++) {
  1893			enum mtk_ddp_comp_id comp_id = path[i].comp_id;
  1894			struct device_node *node;
  1895			struct mtk_ddp_comp *comp;
  1896	
  1897			priv = priv->all_drm_private[path[i].sys];
  1898			node = priv->comp_node[comp_id];
  1899			comp = &priv->ddp_comp[comp_id];
  1900	
  1901			/* Not all drm components have a DTS device node, such as ovl_adaptor,
  1902			 * which is the drm bring up sub driver
  1903			 */
  1904			if (!node && comp_id != DDP_COMPONENT_DRM_OVL_ADAPTOR &&
  1905			    comp_id != DDP_COMPONENT_DRM_OVLSYS_ADAPTOR0 &&
  1906			    comp_id != DDP_COMPONENT_DRM_OVLSYS_ADAPTOR1 &&
  1907			    comp_id != DDP_COMPONENT_DRM_OVLSYS_ADAPTOR2 &&
  1908			    mtk_ddp_comp_get_type(comp_id) != MTK_DISP_VIRTUAL) {
  1909				dev_info(dev,
  1910					"Not creating crtc %d because component %d is disabled or missing\n",
  1911					crtc_i, comp_id);
  1912				return 0;
  1913			}
  1914	
  1915			if (!comp->dev && mtk_ddp_comp_get_type(comp_id) != MTK_DISP_VIRTUAL) {
  1916				dev_err(dev, "Component %pOF not initialized\n", node);
  1917				return -ENODEV;
  1918			}
  1919		}
  1920	
  1921		mtk_crtc = devm_kzalloc(dev, sizeof(*mtk_crtc), GFP_KERNEL);
  1922		if (!mtk_crtc)
  1923			return -ENOMEM;
  1924	
  1925		mtk_crtc->qos_ctx = devm_kzalloc(dev, sizeof(struct mtk_crtc_qos_ctx), GFP_KERNEL);
  1926		if (!mtk_crtc->qos_ctx)
  1927			return -ENOMEM;
  1928	
  1929		for (i = 0; i < MAX_MMSYS; i++)
  1930			if (priv->all_drm_private[i])
  1931				mtk_crtc->mmsys_dev[i] = priv->all_drm_private[i]->mmsys_dev;
  1932		mtk_crtc->ddp_comp_nr = path_len;
  1933		mtk_crtc->ddp_comp = devm_kcalloc(dev,
  1934						  mtk_crtc->ddp_comp_nr + (conn_routes ? 1 : 0),
  1935						  sizeof(*mtk_crtc->ddp_comp),
  1936						  GFP_KERNEL);
  1937		if (!mtk_crtc->ddp_comp)
  1938			return -ENOMEM;
  1939	
  1940		mtk_crtc->ddp_comp_sys = devm_kmalloc_array(dev, mtk_crtc->ddp_comp_nr +
  1941							    (conn_routes ? 1 : 0),
  1942							    sizeof(*mtk_crtc->ddp_comp_sys), GFP_KERNEL);
  1943		if (!mtk_crtc->ddp_comp_sys)
  1944			return -ENOMEM;
  1945	
  1946		for (i = 0; i < MAX_MMSYS; i++) {
  1947			if (!priv->all_drm_private[i])
  1948				continue;
  1949	
  1950			priv = priv->all_drm_private[i];
  1951			mtk_crtc->mutex[i] = mtk_mutex_get(priv->mutex_dev);
  1952			if (IS_ERR(mtk_crtc->mutex[i])) {
  1953				ret = PTR_ERR(mtk_crtc->mutex[i]);
  1954				dev_err(dev, "Failed to get mutex: %d\n", ret);
  1955				return ret;
  1956			}
  1957		}
  1958	
  1959		for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
  1960			unsigned int comp_id = path[i].comp_id;
  1961			struct mtk_ddp_comp *comp;
  1962	
  1963			priv = priv->all_drm_private[path[i].sys];
  1964			comp = &priv->ddp_comp[comp_id];
  1965			if (mtk_ddp_comp_get_type(comp_id) == MTK_DISP_VIRTUAL)
  1966				comp->id = comp_id;
  1967			mtk_crtc->ddp_comp[i] = comp;
  1968			mtk_crtc->ddp_comp_sys[i] = path[i].sys;
  1969			mtk_crtc->exist[path[i].sys] = true;
  1970	
  1971			if (comp->funcs) {
  1972				if (comp->funcs->gamma_set && comp->funcs->gamma_get_lut_size) {
  1973					unsigned int lut_sz = mtk_ddp_gamma_get_lut_size(comp);
  1974	
  1975					if (lut_sz)
  1976						gamma_lut_size = lut_sz;
  1977				}
  1978	
  1979				if (comp->funcs->ctm_set)
  1980					has_ctm = true;
  1981	
  1982	
  1983				if (comp->funcs->crc_cnt && comp->funcs->crc_cnt(comp->dev) &&
  1984				    !mtk_crtc->crc_provider) {
  1985					mtk_crtc->crc_provider = comp;
  1986					comp->funcs->crc_attach(comp->dev, mtk_crtc);
  1987				}
  1988	
  1989			}
  1990	
  1991			mtk_ddp_comp_register_vblank_cb(comp, mtk_crtc_ddp_irq,
  1992							&mtk_crtc->base);
  1993		}
  1994	
  1995		for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
  1996			num_comp_planes += mtk_crtc_num_comp_planes(mtk_crtc, i);
  1997	
  1998		mtk_crtc->planes = devm_kcalloc(dev, num_comp_planes,
  1999						sizeof(struct drm_plane), GFP_KERNEL);
  2000		if (!mtk_crtc->planes)
  2001			return -ENOMEM;
  2002	
  2003		for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
  2004			ret = mtk_crtc_init_comp_planes(drm_dev, mtk_crtc, i, crtc_i);
  2005			if (ret)
  2006				return ret;
  2007		}
  2008	
  2009		/*
  2010		 * Default to use the first component as the dma dev.
  2011		 * In the case of ovl_adaptor sub driver, it needs to use the
  2012		 * dma_dev_get function to get representative dma dev.
  2013		 */
  2014		priv = priv->all_drm_private[path[0].sys];
  2015		mtk_crtc->dma_dev = mtk_ddp_comp_dma_dev_get(&priv->ddp_comp[path[0].comp_id]);
  2016	
  2017		mtk_crtc->vdisp_ao_dev = priv->vdisp_ao_dev;
  2018		mtk_crtc->dpc_dev = priv->dpc_dev;
  2019		mtk_crtc->pmqos_dev = priv->pmqos_dev;
  2020		ret = mtk_crtc_init(drm_dev, mtk_crtc, crtc_i);
  2021		if (ret < 0)
  2022			return ret;
  2023	
  2024		if (gamma_lut_size)
  2025			drm_mode_crtc_set_gamma_size(&mtk_crtc->base, gamma_lut_size);
  2026		drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, has_ctm, gamma_lut_size);
  2027		mutex_init(&mtk_crtc->hw_lock);
  2028		spin_lock_init(&mtk_crtc->config_lock);
> 2029		init_completion(&mtk_crtc->fast_modeset_done);
  2030	
  2031		if (mtk_crtc->layer_nr) {
  2032			for (i = 0; i < mtk_crtc->layer_nr; i++)
  2033				mtk_ddp_comp_channel_id_get(&priv->ddp_comp[path[0].comp_id], i,
  2034							    &mtk_crtc->qos_ctx->plane_channel_id[i]);
  2035		}
  2036	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
