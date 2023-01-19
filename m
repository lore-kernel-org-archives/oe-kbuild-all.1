Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3112F2F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 08:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674117649; x=1705653649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mu+AyNKALHh8mUXN2k/Ibt921zEhnwL0VPRRX1UiWqY=;
  b=JI87j875VbQfwKVYh5ZcpJF245DuCCmkPLGLOlTZhE3kAEAQ29goq0cw
   xdpJabZrHs1TrOwZjWwoAblyPFp7eNrQ37m1gzAycV0aBsjxFP15WDdla
   qTLV64AlfKmymXcQyDT7D+Vm0GMrOeusXmnKMaIpKE+1bq+XRY7p0P3Pr
   FvSxMSib0esRE3npOL3kaRjJRTV2pMuwgNlAk+I96mVG8Jv1Ri7F+1K0P
   U9j9dnsrubz4V/F1w0ndStQQ2I0JLxtzEgzSDSEf6R+e6+neic5vgn+7s
   EoT7GTachxUPdfF/QQniX0SjDMhR+05Kqb16awchtYUnvog1Gce3zIEj+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="327305752"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="327305752"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 00:40:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="768132187"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="768132187"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2023 00:40:47 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 00:40:47 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 00:40:46 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 00:40:46 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 19 Jan 2023 00:40:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqmx9HDDSpYTEh32rJPZm+3Y9EJxVrIe8mZLwHopDg+KR1jIaVhwgy2sFddhbmVmJKA9H46MukRXJklgww+Quv737ObSpuEcnZ8hfCeRKHqTmFQ0BfRWFxrdG+AejrhOaVDdJKeIsrh41gwc/w1lbDRanxejUoJb1IGchqdPrXYvJ45g6hjsNRDak7Dd6zV8zBa8MbgtC3SnmSxP3qmG1lu7ceZDcZlkPv7u+kUDwpY7JbKIBSPl9hDJd3faxmngzAQn+d2UPr3t3JbR3LCTsrGshJTkt9VdwKs8FgFb2HTj0gYO02DY1wLVn4jV36J23re9IvzGMqWXlOSkl3J9pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/QEEbk4J3E5SVNJWpNfbUw7EvBBYdbjWVbuVwf9Yih8=;
 b=ZHgwAPPSN4jqqpPmwK1TPJA2F3tDeOHLjwRomLhgpuwFaLbL/vq2rlNUk6IchzmAon+HafD9F8WYqxpiIttWW/LzwfWonKy3/0yju/Ph0H0kKnrOV1lmROJ6EFUnHY0JFfQq9s7KDJfVeYy5WZhpx9jb6wUoTxDqbifGp+2Uwg6MZErq5E6q/obIbzLTOYwvZmc9KTbB38KoRrubpiEhPhMQ0oZEyZSPNFKvz0M9fNkDxteddW+vlO8OWLO4/W9cP2xxwQl+VTQuBD69vuLa4OzqKh/XajQXbuEHxUxzRuDUSm7mw+unbuDc4UaW1b15ZUSf2yDWyXHm7zU/3E+rHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 19 Jan
 2023 08:40:38 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::30e3:a7ab:35ba:93bb]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::30e3:a7ab:35ba:93bb%9]) with mapi id 15.20.6002.013; Thu, 19 Jan 2023
 08:40:38 +0000
Date: Thu, 19 Jan 2023 16:38:44 +0800
From: kernel test robot <yujie.liu@intel.com>
To: "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, nanli2x <nanx.li@intel.com>
Subject: [intel-lts:5.15/linux 16/16]
 drivers/i2c/busses/i2c-designware-pcidrv.c:69:12: warning: unused function
 'dw_reg_read'
Message-ID: <Y8kBlFlmXVDezNNS@yujie-X299>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0187.apcprd04.prod.outlook.com
 (2603:1096:4:14::25) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SJ2PR11MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: 82523279-62cf-4577-7262-08daf9f8d6c9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ql6AOVlbe0MNVi9aXqghubQ0FUoFSMjCMKhphPpuSHn8TZH9yfIPAyzlMzg65Q3uT0sD2xlfyprghgjEBebN+wAOpUYa3/lAtoLJ37P5emBKC3Sb2H2A3xn/QnYi8jeaq+YY9Ky7iZb4WR7EF+1uVr3LjvB4OCNADa15X21Kl6FzXqYAxHgyJdSeHWPswSj34YDGocsVLblz+1KhrGa2r2lJp58mHeNz6zJU+pg1dTUKGtoc36Y7hOj3Rm3ozvcB0coRSEm7QhLDfuMBp39hd3rJWKdpIYdVYem/jAjSwM9n/UOgvgHOD8BBRXtwoyl/9oG0XqIQdbPBrm9zobFO91xXpnQL3UB1fxDlDn0hfFiHmH9ncPzG1HvsJ25Qcp9BUWhqoLP/qg/Me0ckHuksObVk0ZA0B0f1cvkp+pr+IdbREHhI1AAetl4HGsKvaaFPWwXblLkWvbVcuEhcpgujEE+5dsllUCyn9tgCMhY5AJ+2O+oMCA+U2sUCVxu+bveDOUffz4NYOD7uivr1JDkgPtsdRdyLKtZ8DUMoMV+QUrHigV3a/Rs0yuZAjO2osm+7TrRVIkOCNQd4c08MfwlJbVq5O2D9ntrkSbur5zynvLjpAqJLBGzYwPKDQJodhC6FGPE6c9wxYV7W+urYTd1z0+XPdLNgbJrQfHrH4xy+mk2RJtgeYcIVZ1VtsfTgc2cWJrPKghz5rjH2KlUaUgS/lQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(39860400002)(346002)(366004)(396003)(376002)(136003)(451199015)(82960400001)(83380400001)(86362001)(41300700001)(38100700002)(8676002)(4326008)(6862004)(2906002)(5660300002)(8936002)(66946007)(66476007)(66556008)(478600001)(9686003)(26005)(6506007)(107886003)(33716001)(186003)(6512007)(6636002)(6666004)(6486002)(316002)(966005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l/CGzchOe+gVavbF4pyMmYpuM4iUah52tVR7xzBw9mobBWVf13xpoWXjjpWe?=
 =?us-ascii?Q?mcS/8Wu9u5ambi44+SMdrb3RmZITmIkELrgoeBC7tRcOihA3K3eTBEWufFXI?=
 =?us-ascii?Q?9oFdD7wXAVbnrX0pg4tFLKCrjg/x4w2/ACMd2+NsRun7rSKy9ir61UMtKd7r?=
 =?us-ascii?Q?EGEO4GQs9A5eq7JdUD1rBn51Gyl8+bKMAo7fiXL5Fss7wABWwyyyKQQRMcaH?=
 =?us-ascii?Q?maAUb5/k9DEHzWOfEkm3F5hGdc8wvlPbT1CM/Qs475HiScaZWy5U9xkbIvfP?=
 =?us-ascii?Q?RbLql0u7RmruFfpVnmjUw16yfcui1S1za3wb/Tyz/8nj9fEDNLHosnPMnKN5?=
 =?us-ascii?Q?9JaT6g1A63Q9opczZq4W1rUR8nhJyktcYrh+Hnn1Sc8/689VyXLiG/T2sO1w?=
 =?us-ascii?Q?KbcW6i1Po5xI4OI3JEF+9yve/NLQ0iOCrEq/C06OqrXMaT2piNqDJigxURvM?=
 =?us-ascii?Q?kZYfcKbhRczrKBWKdyujSxisd1eoo0paRM4Q/21k7QIaxc48Edc0DN5LrHJX?=
 =?us-ascii?Q?pXdEf04IcHkOTopDfbVrewnR0AlQ07NnCWdGxyrElPdIswFukVQf9NMd4k1w?=
 =?us-ascii?Q?npTrIZ+tKUdMszhHVJNRb5NHXtlXSrPAPvk0jGhfd5Uo6aMQx1tsLYX8K8Zs?=
 =?us-ascii?Q?lUEFugNJmCtv2BCfnQ123yt8orlqBONGjW1TdZq5NHxFCJB7Xi+cGOu7NLgI?=
 =?us-ascii?Q?ROO5lOWOifxVytmiOFPRmZY2LJRVUkTRswZQQP/eqL+04Xj01N9r7tIipZ2i?=
 =?us-ascii?Q?lGS5mL3e7HEbfn/fIszyrLAfJpQkVRa29OFpx6n7KjutLKnN8gafZIT6m8wT?=
 =?us-ascii?Q?jwKFrrweFz8sm9YE4lCRDV9WzmkgV3tdMYx/Rd6nq/cPGSDVCGpZ97P5RoIr?=
 =?us-ascii?Q?Yz7ZLLlfaesPlORdz/VEuVavZ0AogwD7NEnP8Y8DUxLPzuLPlF68grdLe5Br?=
 =?us-ascii?Q?uhkRJEtRgwl0zLkvmiFj7UtwsF2UblAS1kyVcKHx72D2QvOKWp9oFaM/AuSc?=
 =?us-ascii?Q?1eoqauvmeDAuWDLupc7TnpwGOeSAxUpp/nP2mJX059g1rotiQKukRbFqAOEy?=
 =?us-ascii?Q?vyKZvCS832mowbD/5kKT2v0nQvt2TDePs32haFE5J11Ab9wc0lunwkjd6+my?=
 =?us-ascii?Q?yh1PjlW1K8q5Id+ddH2W65IPb9QNkXLF3PQ/dB1rZgMhh8VOeDDHl7BL3oLO?=
 =?us-ascii?Q?u1Du7hK5fvTEyWGYDMhR2jb1yxcycO5pEbohmbc8DkXcMU4qkkMkYWB10Ipc?=
 =?us-ascii?Q?veuuPFes2BHlp2/wZre23/Hk3k57C63uMcurdzjsAY6hYlrF1KMo1K0h3kBm?=
 =?us-ascii?Q?n8zOsxjkGIWD0nhMQUtukMpNuChryqLGbmEsVYxcjCIeVqVb59Skp/OwyysC?=
 =?us-ascii?Q?xG2txx+H6LBikQzRGXaqNpfurgi8Mwe4OnBlcM2QgRGaAEjBv9zTXpXJwfQM?=
 =?us-ascii?Q?i2Iz/RZlJmMhDVD3BAdR7NVzuE2Dnrf8hoxvX08Thyufv5ssM+UxJdSHg56S?=
 =?us-ascii?Q?iGccyVHOKHG6aq6kirKfdLvoz7ll5iCQ8BS7zJ1f0bRSPq7gZ50bxyzU98yw?=
 =?us-ascii?Q?NqJCVSoUqy/2RyuyGe+u7l73oWXTJ+mt08UAwZBo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82523279-62cf-4577-7262-08daf9f8d6c9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 08:40:37.8797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yb6dzEesIecS/OjsyS6gCUQkd9zOlxst24nn1uF/DPOlU5rcmPw5ZDcSozuz3koDHPyz+UP1GZSz8N0yz93U0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7573
X-OriginatorOrg: intel.com

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   4e26912f977bc8d60339bfcd56a777a08ded493d
commit: 1ec5959a8f6dbfbb47057317bc935924cd8d6977 [16/16] i2c: Add read and write functions in pcidrv
config: s390-randconfig-r004-20230118 (https://download.01.org/0day-ci/archive/20230119/202301191334.w0M07yQz-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel/linux-intel-lts/commit/1ec5959a8f6dbfbb47057317bc935924cd8d6977
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.15/linux
        git checkout 1ec5959a8f6dbfbb47057317bc935924cd8d6977
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/i2c/busses/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <yujie.liu@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-designware-pcidrv.c:69:12: warning: unused function 'dw_reg_read' [-Wunused-function]
   static int dw_reg_read(struct dw_i2c_dev *dev, unsigned int reg, unsigned int *val)
              ^
>> drivers/i2c/busses/i2c-designware-pcidrv.c:75:12: warning: unused function 'dw_reg_write' [-Wunused-function]
   static int dw_reg_write(struct dw_i2c_dev *dev, unsigned int reg, unsigned int val)
              ^

Please note this build test doesn't set CONFIG_PM in the config


vim +/dw_reg_read +69 drivers/i2c/busses/i2c-designware-pcidrv.c

fe20ff5c7e9ca7f Dirk Brandewie      2011-10-06  68  
1ec5959a8f6dbfb D, Lakshmi Sowjanya 2022-03-03 @69  static int dw_reg_read(struct dw_i2c_dev *dev, unsigned int reg, unsigned int *val)
1ec5959a8f6dbfb D, Lakshmi Sowjanya 2022-03-03  70  {
1ec5959a8f6dbfb D, Lakshmi Sowjanya 2022-03-03  71  	*val = readl_relaxed(dev->base + reg);
1ec5959a8f6dbfb D, Lakshmi Sowjanya 2022-03-03  72  	return 0;
1ec5959a8f6dbfb D, Lakshmi Sowjanya 2022-03-03  73  }
1ec5959a8f6dbfb D, Lakshmi Sowjanya 2022-03-03  74  
1ec5959a8f6dbfb D, Lakshmi Sowjanya 2022-03-03 @75  static int dw_reg_write(struct dw_i2c_dev *dev, unsigned int reg, unsigned int val)
1ec5959a8f6dbfb D, Lakshmi Sowjanya 2022-03-03  76  {
1ec5959a8f6dbfb D, Lakshmi Sowjanya 2022-03-03  77  	writel_relaxed(val, dev->base + reg);
1ec5959a8f6dbfb D, Lakshmi Sowjanya 2022-03-03  78  	return 0;
1ec5959a8f6dbfb D, Lakshmi Sowjanya 2022-03-03  79  }
1ec5959a8f6dbfb D, Lakshmi Sowjanya 2022-03-03  80  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
