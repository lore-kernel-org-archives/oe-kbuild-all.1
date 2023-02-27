Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11E5746B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 15:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677510119; x=1709046119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JkT+j5SySHh+lrGE+F3B1zdrlWGdMiBhJQHOH7xgvMk=;
  b=bKSI+Uhd6UjpQtrsx2pVBVAqaqLsj71Xufmguqh8Ij5bc7JulcB5pEuI
   +KAq8sCN+4UO4H+kG84TPlOyewkrPBS/a/0xcqzlpfYozV7KQ60uSjfcO
   xQQCS59b/RlUm5uaZ2drc4NhJjZwT7QNsBJF+2b3uLQo14UMC80tO8smL
   NIoMp0rWY9jlGqPlHR1f+9TIG49PcVHRjS2ou4saXhrvNFq3f4Ly00O5L
   XcZL0DpP47wZzQ7fwa8Tc66TA0xcWDXowYiRZlzy30zk3RmPZURVt+q9x
   MIk2dd940eZApq5UWXemt8mWG3uewc3geeipZ+zL0Tdnw3r3nTqrs4qtt
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="332597897"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="332597897"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 07:01:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="847883164"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="847883164"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Feb 2023 07:01:46 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWf0b-0004W5-2U;
	Mon, 27 Feb 2023 15:01:45 +0000
Date: Mon, 27 Feb 2023 23:01:13 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rpi-6.2.y-await-linktraining 13/583]
 drivers/gpu/drm/vc4/vc4_firmware_kms.c:1486:1: warning: no previous
 prototype for 'vc4_connector_duplicate_state'
Message-ID: <202302272231.IBzpe8sz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux rpi-6.2.y-await-linktraining
head:   f3a9201f7f484c1295cdec53c1b9bd2a19ffb231
commit: 2431fe0204171ecc028c8d8c9b220eb868d181d8 [13/583] drm/vc4: Add firmware-kms mode
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230227/202302272231.IBzpe8sz-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/2431fe0204171ecc028c8d8c9b220eb868d181d8
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k rpi-6.2.y-await-linktraining
        git checkout 2431fe0204171ecc028c8d8c9b220eb868d181d8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/char/ drivers/gpu/drm/vc4/ drivers/staging/vc04_services/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302272231.IBzpe8sz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vc4/vc4_firmware_kms.c:1486:1: warning: no previous prototype for 'vc4_connector_duplicate_state' [-Wmissing-prototypes]
    1486 | vc4_connector_duplicate_state(struct drm_connector *connector)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/vc4/vc4_firmware_kms.c:1507:5: warning: no previous prototype for 'vc4_connector_atomic_get_property' [-Wmissing-prototypes]
    1507 | int vc4_connector_atomic_get_property(struct drm_connector *connector,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/vc4/vc4_firmware_kms.c:1537:5: warning: no previous prototype for 'vc4_connector_atomic_set_property' [-Wmissing-prototypes]
    1537 | int vc4_connector_atomic_set_property(struct drm_connector *connector,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/vc4/vc4_firmware_kms.c:1557:5: warning: no previous prototype for 'vc4_connector_atomic_check' [-Wmissing-prototypes]
    1557 | int vc4_connector_atomic_check(struct drm_connector *connector,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/vc4_connector_duplicate_state +1486 drivers/gpu/drm/vc4/vc4_firmware_kms.c

  1475	
  1476	/**
  1477	 * vc4_connector_duplicate_state - duplicate connector state
  1478	 * @connector: digital connector
  1479	 *
  1480	 * Allocates and returns a copy of the connector state (both common and
  1481	 * digital connector specific) for the specified connector.
  1482	 *
  1483	 * Returns: The newly allocated connector state, or NULL on failure.
  1484	 */
  1485	struct drm_connector_state *
> 1486	vc4_connector_duplicate_state(struct drm_connector *connector)
  1487	{
  1488		struct vc4_fkms_connector_state *state;
  1489	
  1490		state = kmemdup(connector->state, sizeof(*state), GFP_KERNEL);
  1491		if (!state)
  1492			return NULL;
  1493	
  1494		__drm_atomic_helper_connector_duplicate_state(connector, &state->base);
  1495		return &state->base;
  1496	}
  1497	
  1498	/**
  1499	 * vc4_connector_atomic_get_property - hook for connector->atomic_get_property.
  1500	 * @connector: Connector to get the property for.
  1501	 * @state: Connector state to retrieve the property from.
  1502	 * @property: Property to retrieve.
  1503	 * @val: Return value for the property.
  1504	 *
  1505	 * Returns the atomic property value for a digital connector.
  1506	 */
> 1507	int vc4_connector_atomic_get_property(struct drm_connector *connector,
  1508					      const struct drm_connector_state *state,
  1509					      struct drm_property *property,
  1510					      uint64_t *val)
  1511	{
  1512		struct vc4_fkms_connector *fkms_connector =
  1513						to_vc4_fkms_connector(connector);
  1514		struct vc4_fkms_connector_state *vc4_conn_state =
  1515						to_vc4_fkms_connector_state(state);
  1516	
  1517		if (property == fkms_connector->broadcast_rgb_property) {
  1518			*val = vc4_conn_state->broadcast_rgb;
  1519		} else {
  1520			DRM_DEBUG_ATOMIC("Unknown property [PROP:%d:%s]\n",
  1521					 property->base.id, property->name);
  1522			return -EINVAL;
  1523		}
  1524	
  1525		return 0;
  1526	}
  1527	
  1528	/**
  1529	 * vc4_connector_atomic_set_property - hook for connector->atomic_set_property.
  1530	 * @connector: Connector to set the property for.
  1531	 * @state: Connector state to set the property on.
  1532	 * @property: Property to set.
  1533	 * @val: New value for the property.
  1534	 *
  1535	 * Sets the atomic property value for a digital connector.
  1536	 */
> 1537	int vc4_connector_atomic_set_property(struct drm_connector *connector,
  1538					      struct drm_connector_state *state,
  1539					      struct drm_property *property,
  1540					      uint64_t val)
  1541	{
  1542		struct vc4_fkms_connector *fkms_connector =
  1543						to_vc4_fkms_connector(connector);
  1544		struct vc4_fkms_connector_state *vc4_conn_state =
  1545						to_vc4_fkms_connector_state(state);
  1546	
  1547		if (property == fkms_connector->broadcast_rgb_property) {
  1548			vc4_conn_state->broadcast_rgb = val;
  1549			return 0;
  1550		}
  1551	
  1552		DRM_DEBUG_ATOMIC("Unknown property [PROP:%d:%s]\n",
  1553				 property->base.id, property->name);
  1554		return -EINVAL;
  1555	}
  1556	
> 1557	int vc4_connector_atomic_check(struct drm_connector *connector,
  1558				       struct drm_atomic_state *state)
  1559	{
  1560		struct drm_connector_state *old_state =
  1561			drm_atomic_get_old_connector_state(state, connector);
  1562		struct vc4_fkms_connector_state *vc4_old_state =
  1563						to_vc4_fkms_connector_state(old_state);
  1564		struct drm_connector_state *new_state =
  1565			drm_atomic_get_new_connector_state(state, connector);
  1566		struct vc4_fkms_connector_state *vc4_new_state =
  1567						to_vc4_fkms_connector_state(new_state);
  1568		struct drm_crtc *crtc = new_state->crtc;
  1569	
  1570		if (!crtc)
  1571			return 0;
  1572	
  1573		if (vc4_old_state->broadcast_rgb != vc4_new_state->broadcast_rgb) {
  1574			struct drm_crtc_state *crtc_state;
  1575	
  1576			crtc_state = drm_atomic_get_crtc_state(state, crtc);
  1577			if (IS_ERR(crtc_state))
  1578				return PTR_ERR(crtc_state);
  1579	
  1580			crtc_state->mode_changed = true;
  1581		}
  1582		return 0;
  1583	}
  1584	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
