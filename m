Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE91A3C22
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 May 2023 09:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683539371; x=1715075371;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l2HeP0jAyL1+Y2WK0T3i8q3wTglPNlkxc+pJx7097sw=;
  b=DO9uslCzFgezhabQFwKtEsAidWanb/cGAb1TZPpX2XIXUr/A1LJJ6mtl
   AtgRD74pB+zfNl1W4k3AX71QAL3i4dypbKdbeKG2xIz4eahYK8DEbBv2R
   lwwnp9JQ8ZASh3aN5scKnyEmA++DUdiRaMQXmq+DKcoI4YokJOSLwxoKL
   6HVr1nPgDLXe/trlhDi/PEC/oU8InwVM/IM83gFJSyafR2vbFbuOCRchV
   aXmYXcfzbOVwZBuS1Bd1pFifv2n/rqNECPz7S1EEKK13RbDgbW/oqgEVi
   p3g6hkiiOXJ18cWylUc49ZudX9FeYpz983q0O8M1UE+QfId2bkr8AMFM4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="347069354"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="347069354"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 02:49:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="810196567"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="810196567"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 08 May 2023 02:49:30 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvxUn-0001At-22;
	Mon, 08 May 2023 09:49:29 +0000
Date: Mon, 8 May 2023 17:48:29 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/1] media: pci: ipu3-cio2: Obtain remote pad from
 endpoint
Message-ID: <202305081727.dqEMyxyM-lkp@intel.com>
References: <20230508064123.979451-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508064123.979451-1-sakari.ailus@linux.intel.com>

Hi Sakari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-pci-ipu3-cio2-Obtain-remote-pad-from-endpoint/20230508-144532
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230508064123.979451-1-sakari.ailus%40linux.intel.com
patch subject: [PATCH v2 1/1] media: pci: ipu3-cio2: Obtain remote pad from endpoint
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230508/202305081727.dqEMyxyM-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/68c87524825aee53569c763e18948d5571271fa9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sakari-Ailus/media-pci-ipu3-cio2-Obtain-remote-pad-from-endpoint/20230508-144532
        git checkout 68c87524825aee53569c763e18948d5571271fa9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/media/pci/intel/ipu3/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305081727.dqEMyxyM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/pci/intel/ipu3/ipu3-cio2-main.c: In function 'cio2_notifier_complete':
>> drivers/media/pci/intel/ipu3/ipu3-cio2-main.c:1428:66: warning: passing argument 2 of 'media_entity_get_fwnode_pad' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1428 |                                                   s_asd->endpoint.local_fwnode,
         |                                                   ~~~~~~~~~~~~~~~^~~~~~~~~~~~~
   In file included from include/media/media-device.h:20,
                    from include/media/media-request.h:20,
                    from include/media/v4l2-ctrls.h:14,
                    from drivers/media/pci/intel/ipu3/ipu3-cio2-main.c:25:
   include/media/media-entity.h:1082:55: note: expected 'struct fwnode_handle *' but argument is of type 'const struct fwnode_handle *'
    1082 |                                 struct fwnode_handle *fwnode,
         |                                 ~~~~~~~~~~~~~~~~~~~~~~^~~~~~


vim +1428 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c

  1412	
  1413	/* .complete() is called after all subdevices have been located */
  1414	static int cio2_notifier_complete(struct v4l2_async_notifier *notifier)
  1415	{
  1416		struct cio2_device *cio2 = to_cio2_device(notifier);
  1417		struct device *dev = &cio2->pci_dev->dev;
  1418		struct sensor_async_subdev *s_asd;
  1419		struct v4l2_async_subdev *asd;
  1420		struct cio2_queue *q;
  1421		int ret;
  1422	
  1423		list_for_each_entry(asd, &cio2->notifier.asd_list, asd_list) {
  1424			s_asd = to_sensor_asd(asd);
  1425			q = &cio2->queue[s_asd->csi2.port];
  1426	
  1427			ret = media_entity_get_fwnode_pad(&q->sensor->entity,
> 1428							  s_asd->endpoint.local_fwnode,
  1429							  MEDIA_PAD_FL_SOURCE);
  1430			if (ret < 0) {
  1431				dev_err(dev, "no endpoint for %pfw (%d)\n",
  1432					s_asd->endpoint.local_fwnode, ret);
  1433				return ret;
  1434			}
  1435	
  1436			ret = media_create_pad_link(&q->sensor->entity, ret,
  1437						    &q->subdev.entity, CIO2_PAD_SINK,
  1438						    0);
  1439			if (ret) {
  1440				dev_err(dev, "failed to create link for %s (endpoint %pfw, error %d)\n",
  1441					q->sensor->name, s_asd->endpoint.local_fwnode,
  1442					ret);
  1443				return ret;
  1444			}
  1445		}
  1446	
  1447		return v4l2_device_register_subdev_nodes(&cio2->v4l2_dev);
  1448	}
  1449	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
