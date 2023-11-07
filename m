Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782FA441F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 02:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f4mjB0GJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699325064; x=1730861064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UG3cj5hpwSW3pObm01RNu3aktE6jz9cCBhg2dfDHAMA=;
  b=f4mjB0GJZseo9b6hGzSYVxSdYHiXk7MZl/Tzn9s0ZKncOVvDXM0JJ8LZ
   7QZremyGLeXWwKfKNy3mMEteINvzabspt+Gt9Qck+nEfq3Im/UunZadhc
   kZx7wgZvV16g/cqWPuv8GqiOGEavlt05wa7ZB+6jaLw08WhQUAopJF5sJ
   KbJZef6UwnU9U1BXg6PI8y9lmLQDhD6D+CwH1EK9gz7DQXwMDbsPB2piR
   qsEN7qcB6jIAamMOOHEj8wlTNvhrwjY9w+RZ92CWXL+sCjQuHPBI1TE2o
   qUsxwxbmZoIwp9K2dAkk9Gn2/6L/QAYhs6bx90LX3AP/04xYpdfN1iNjX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="2339301"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="2339301"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 18:44:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="791661827"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="791661827"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Nov 2023 18:44:22 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 6 Nov 2023 18:44:22 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 6 Nov 2023 18:44:22 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 6 Nov 2023 18:44:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kfj8kro4hkp5dbCOWfMcQ/Zvsp2phzkfLo9umPOsTkisdMpjDcddhCHiHbyKbateWeM6SeTVQQS3Bk1oHHixZPs2fZ3kBcJAYPxB2ckSpe1CQ7vZ1IWqlSd5YZKxtbgVyVvnwAWd9/rOxOZjq3s9t8qcjr9CtDGGrv01T90weOXECp55yFOwV6ACoobiGkBEwXEs8uYrtLz+jE+ENv87hmBNNEUSI6trP/gXO/V6jOrP/Yzq9S93pmHqDQBjknaWOsacjxGy/HueQ3H0vWaHWPJebuM1CS4zLG+FeOF6lmNZ1p+fc7jY1jg2xM169BHp5CqMxv0CFoMXoyR70TbKXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ToqDZbgFAqn62FvdM+2Vwq+LZjkFId83xHM5gGYB6jA=;
 b=gpPP41VeJu3YgHL6I/2onzvrFiG5Uly4T0hAgUd6yTQC2CIOyokABbk3Eu3GwAyN1dlzNwHKCPCUW2exZd0pt3X5cz9kINUHlQhGh0m/X8F+Cldm+MIN1t+inmcrAArcqs+WS0R57Tx5HJh+Ii5wqg3YV9ddMuK7x2eTG7pXrvup0qb8pH5rFU+oY1UWB19gu2s97x2wU9XdZ7OiAdHwXYYejTWqCOcnIWqWTF+zfLTH3i1fphWtijDgcbZvWQ/jaRji3dAsz13c1jrH6OdZoF3/4u4tKMfGLYQJEtIMrKQ4rw0lidDE7H4+I7XX15yx5kCZFE7fS645oP20Nuc+Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by BN9PR11MB5291.namprd11.prod.outlook.com (2603:10b6:408:118::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 02:44:19 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.6933.028; Tue, 7 Nov 2023
 02:44:19 +0000
Date: Tue, 7 Nov 2023 10:39:36 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, <intel-xe@lists.freedesktop.org>,
	"Rodrigo Vivi" <rodrigo.vivi@intel.com>
Subject: [drm-xe:oak/drm-evictable-lru 2911/3055]
 drivers/gpu/drm/i915/display/intel_display_power.h: linux/mutex.h is
 included more than once.
Message-ID: <202311070416.8nPv4n6G-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::15) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|BN9PR11MB5291:EE_
X-MS-Office365-Filtering-Correlation-Id: fb6889bd-1c47-4361-d052-08dbdf3b70a2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GivOK7B3V231eA9mvIaPqpmlGBwejKTGAAz3v58cx7TQ1BX5/RIWRSaleoetToUW1IOzUIcgvcbMSf119BlJiSLtuplou8uNDay3XYHC7wHFzqrJhANqdToLc1Jlv7RDdj0Bi3Vp2l/l8RWhcqaVp/EUy/mfslNl20FSO4imbzby14P3riQgM9t0CyzOjfaY3HH+fT150Dnb0AFRT5kYT5wHQQrt79mhtKGOt/qVaoQX2feWT/XZeMXJ+8eJMhBAhMt6UQWFmfXi+TeoeuAs32blM4JRlCc/EV0wFG6Xgv/37nVnJvZRaLwcoCNSCp4LMfUFvO+xgrQQ6jlro8HPN7a2XZnOC4auJwgWm2l3elX7GBUpPDWQfVzvfZcNhsP08Ggz/szFsm212vb8E9O49rraFC1gL4cOQTZXsT7balgnHyU7yLM0N62s9peEeKy129T/uc33JtAOHYj64fULHhbL+V495LGkND3ZD+QrSNCMqYIc+dv8alF3Z4hYRdCHIAE77c/XNUl8n4Zit1iatcJVeSJKlLHGFQzmJxMOqMe4KXz0D1OlA4yREYJ+4/I6sTsVEEvmQacWdjgNzIVU1DfTvnMRlcRdgqrLtRT3NhD4e1AbDhe0I8R4C7ymobF7SiSK2K92Pu5ZdWwNXBWSig==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(346002)(396003)(376002)(230173577357003)(230922051799003)(230273577357003)(1800799009)(186009)(64100799003)(451199024)(36756003)(8936002)(83380400001)(316002)(6862004)(4326008)(8676002)(26005)(66476007)(1076003)(66946007)(6636002)(66556008)(37006003)(5660300002)(478600001)(41300700001)(107886003)(6486002)(6512007)(966005)(6666004)(6506007)(2616005)(2906002)(82960400001)(86362001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?noAHy7vcGSXCcdANPTjEa7AXHCRO6fpdXDgXVJ7A7++FbgRi8OdqYjP0vtBw?=
 =?us-ascii?Q?BstuxpFzh6VoWrhRRPngARknop/iPurdISUFSa8Nz0B2OH34CpQ1GJ3t32KT?=
 =?us-ascii?Q?gHQVViNhmMVoHXh5jpj7HsOEGEqf8sDBEizwGYYoKvs62hsT78IAVsbJ3wqa?=
 =?us-ascii?Q?GntS5zP+AFcJihC6rwxI7+6qOQF9KhhuSLxJfEEP0/WzNbW9x6/Bk9wPKtIq?=
 =?us-ascii?Q?toGOgrbDCUvCcl8NmUJcNjb0479lkpFFoptreRmg7rsEYPpGNtCHV9VbPK6D?=
 =?us-ascii?Q?X2Q1C0jwdrrnOPjF6N71ugRht2nIixAN+MEl0GBDwKu7BthE5PzSfirCmiEy?=
 =?us-ascii?Q?p5F45zJF7YAjau7jUyPa1eRGb9/ALfQBXUbfB3CXCsoW/3+I6DbnX3BoLVC+?=
 =?us-ascii?Q?nklJH3BxkrjcUa2VR0+f5LEI02Pn1HcUvEnJ4toP2dIJu/7wiqJmTlCToccE?=
 =?us-ascii?Q?hvTyCahdDksSvwoyFioFPP177Gl9yxKtHp0e3watdo5cjtoH+IJ9tZWrcvSn?=
 =?us-ascii?Q?zD7mnLbW2BRcEPlDhCfTe+ev284h0se+SvJb0hLN1O7E2s3jMTUsavN00DlO?=
 =?us-ascii?Q?SCdVPu4v1pp1d6shPA86EJhkkOGUBU9femkjaFqqELmfhsCr81DmORAu+7Mr?=
 =?us-ascii?Q?F9eILmlJKDp5k/PR4N4Z4jd70qu9AK59UDpn4S6jO5aO9lOJOYiTDrlaZvu4?=
 =?us-ascii?Q?/6mFrpwm9VAHFaArTCOi94gN4JUt8Zz61jzx3xocFLsMWdJuJVtV+Fpo5vkm?=
 =?us-ascii?Q?wuO7kw0zZL6rkkEj/H1PrrNTQqEKoBw0NdbWMR8FLyEpe+VFfmiFo2UMB2Tv?=
 =?us-ascii?Q?ngyeUcQFRdahH88ANUJTm6o3lfonZnbXhBa24hp/1uN5gWoQ/9jGItEIKlGS?=
 =?us-ascii?Q?uF81M0Ln5NQ+Lv1Eo6Hb+1P9ExRNHN87lbFtp0DBjMArtLNMvwUykaT4n+CM?=
 =?us-ascii?Q?MANaJYCD84fkz7SBGsdjaX9y55MNVGq5eSBawQwIdULba/RsmE6Ur1o6qnd3?=
 =?us-ascii?Q?4zLuJu/ld/7euua80cqrR8+C7iN711CW+qZBNasprbhl4FNnWfYWqAvqoe28?=
 =?us-ascii?Q?CQ99+4CftcEcTD8F09I2XLiwZPIu6Kn6M50Y+lWaDhQPkVQbMUbdUMePXIX8?=
 =?us-ascii?Q?KH+kKAoV18okCHOqOGPLwUu1y2cqRAj+gWIa/FCJIKUjk8C7eVDe+UzeJApS?=
 =?us-ascii?Q?Hvf7+JdIV/Sn0fiWJlO9Ofd1FZ1YxZCf7pjPL0PLHQoFHc7AYyDOPSXgxEIJ?=
 =?us-ascii?Q?Ip+C5ADnkEk0pbsxigRwQ7mCFSLW+MC6EnvI7OeC/qt+P4gtk9ALWvJYjT8E?=
 =?us-ascii?Q?prC3ahc5rKIAovhTaknwwTU3/bWgsBUoZ4yDWq4MJTQcmtvebvKbFQ9+oA9Z?=
 =?us-ascii?Q?QUPe2JKOB2J0DqlkG4ezG0UBu6N71s3AttCNKN/HEHhZi0pr5ArtBE8Fnh+m?=
 =?us-ascii?Q?DHV83uHxoKSSDhdLecRPs/gvWGwrKTzZYeYyDlczZci1kmtwQ/Tmyl2COeCc?=
 =?us-ascii?Q?fGF0cQe5mqhzI2ETb/jiNe/4G8Nmg5doIdklLXZX59MOX8J53TDLiyXY7G4R?=
 =?us-ascii?Q?xE/R+5PPZ+cV5YqB0zpSRoy0aibxZn8O7qqeuDE5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb6889bd-1c47-4361-d052-08dbdf3b70a2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 02:44:18.9967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1butHlGJUoKv/W+V8pPeMqfC3r0MxdFRPEt8TUMSuV0id8IBJf9TY9sZBAiEZF6E2tCejmkl3GtvZ/tIj+d20w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5291
X-OriginatorOrg: intel.com

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git oak/drm-evictable-lru
head:   d1f59526925ae851c6abf77af8ae6f8c3cffeebd
commit: 304baa8c20cfad330a6c7cad47d86043e968642c [2911/3055] FIXME: drm/i915: add a lot of includes in intel_display_power.h
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202311070416.8nPv4n6G-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_display_power.h: linux/mutex.h is included more than once.
>> drivers/gpu/drm/i915/display/intel_display_power.h: linux/workqueue.h is included more than once.

vim +9 drivers/gpu/drm/i915/display/intel_display_power.h

     8	
   > 9	#include <linux/mutex.h>
    10	#include <linux/workqueue.h>
    11	
    12	#include "intel_wakeref.h"
    13	#include <linux/types.h>
    14	#include <linux/bitops.h>
  > 15	#include <linux/mutex.h>
    16	#include <linux/workqueue.h>
    17	#include "intel_runtime_pm.h"
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

