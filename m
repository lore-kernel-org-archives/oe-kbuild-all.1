Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3854683
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Nov 2023 08:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B3eTuJ0u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700035638; x=1731571638;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=bh9ZiVukssAP3OtNVJ3Qm2jq5qdWEwXY6BSR8MC4dqQ=;
  b=B3eTuJ0uhz9mDCyo6OLTy+VAMPMePySELO/scV0n4DEWSQU3fYVBtqMi
   Ukin0J0POJpxPnn1h+l6G4xPWeXcMLDfwWpT/lKLXYjZazVqStBrHuZcM
   QbRdcLOuQByGVXaMw5DQDzEzQ6OwtJtWrSdMzxvPCIhL0RcN1U/ELcAp3
   SsshrKKnYgHbhImipXdiWNxrVx9UZAl1m9vUSUZQR/gQGNvnIwO6P1SSa
   dIR4zZlSgpmqU6uSnKqmWbfS1xtK+vFOx95/E7+jwlbIdVTNdYfFv635O
   BqZasnmdWWvw1YU30Fg1GUH3TVKsu/iWFC1ImrrcbXztsinwhwY0epgXz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="421931360"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; 
   d="scan'208";a="421931360"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 00:07:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="741363393"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; 
   d="scan'208";a="741363393"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Nov 2023 00:07:16 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 00:07:15 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 00:07:15 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 00:07:15 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 00:07:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bcJXT2rQ1eQcF8XvCxshlatXUU6QDKEPJaVM3Cmq0RmR5LCRfxIdd+TjXEOsXY2fdIydChSkJgjiGUxnEJTiQbDW0RPyyFiYsQ8YILHVKWc3SYZB2oYkj4+STXzd+XhDaTziXn7du+1e4bOIrnkGrVkczIABTBmijwRvrkCkbmvVsUS0pP4kqKo+ZG+aH6DtfaWv3+VFMqd9f8zIF4xKnrpbsS9r0qxfv6evcA2iMgI62dDUpykskPipb2oh8qtvvO2hCRuq3O40oAIT6BkT/YhRXNBBfEeJm9dho0qbo8BrGK8myMN/FA38j8IA6PQBcm15P0v1hOcLl+qmnXIsqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARutNaOi3+Z5YlHTIdNb3wAkLcIa2D4ZkQGXdETAzf8=;
 b=eg4RWZvf8yBU6mowcSwjKJv4HZRpB2z1lI3zfFuml1nyMisW7tu642+3SPWGCd1LM3fDsGukWAXYI+DT3SQ3RNlKyYdGgOGzD9Oce2kF5HUJt0i1wKsJT5TORihIN+vrtVaKi9dGQW9lWKuwdfxpJVIAeC6HoIALrSzSl7cz8S90QHvoTa3yTzMy+YS35CvKBV2SpcfWr5UJmhT7fvBnHPW85MLBwGOnqGi9gUVGBOLs8KkV0SyBTKK8cPfSbtFqXOBC5nMl6A9yAgEVfsEro/PFjGh2V6Le+MJfQdSAGUsWdd1C+5BjRYrr84sEXaPeZhD0R5KOZ8m8LsGK4R8ueA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH8PR11MB6562.namprd11.prod.outlook.com (2603:10b6:510:1c1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.34; Wed, 15 Nov
 2023 08:07:11 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.6933.028; Wed, 15 Nov 2023
 08:07:11 +0000
Date: Wed, 15 Nov 2023 16:02:30 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [kabel:realtek-sfp-work 8/20] drivers/net/phy/mdio_debugfs.c:53:5:
 warning: no previous prototype for 'mdiobus_register_debugfs'
Message-ID: <202311150909.QLgwVtTa-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0036.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::11) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|PH8PR11MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: d48869d0-a7c7-42b3-c5af-08dbe5b1deb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5XsW52Qj1drlbUR21HgCrcZmrvtTXpgHilSONc9sd7z8SNn9HUgqvVjCDw+EMDRfQIimZev3ASSbKzjVzrMc2SIWgmWE4MVkojyP6DT3JLcIpb/bueYMX94RX93aslc6EhgL1I+o7Phay+qXrPzb1SHixIDAEjNoKd0P5gvZz6cX9sIjFzlKkjTczVSH35ggbGEnOjIBY9wygE+942+aJUtMYsu6zxmz3LvQUIJ8IOMb74j9Djh68eiPbCqhl4Z9SpBG5/WXIBOlrvtS4mUjE55ZEyG0g/Z+cvuz886b2w7GnGNwsDIvUVQDcpcbFCXAcyfwnI8rlFF4W2i9OfCqQeahMVhMh36zlATzZnRMv3lp2M8EiBLmoskA4eyLT6pnQ6/V9AeEuVOOm1moIvGusec9kQvW8kkfSlYXPQWxi3eQK4EwZ87MQ+MIEEDlHHpQ+rMViEz2YkqVoSb1n6pon8H1EwBSjEYWHg0FVgECJRDvZHkQLicEFgfPaZJ2T9A7ca7xsBX7VAkHXnkuFQmcMsf8Sle+rZZVfHW99qrWg2LzFbiTV8eRlzSV1ahMb2eUp7PXBhvh1vH7SKih19Ia86xCsJxrb/jL+IwR+E2PRSE7lDrtVlXOxR8/b/BZnDR7Y1iNXbW2tyx06fVrC8qUVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(396003)(366004)(39860400002)(230922051799003)(230273577357003)(230173577357003)(64100799003)(1800799009)(186009)(451199024)(2616005)(1076003)(6916009)(316002)(66476007)(66556008)(66946007)(8936002)(8676002)(4326008)(66574015)(83380400001)(26005)(82960400001)(36756003)(478600001)(966005)(6486002)(6666004)(6506007)(6512007)(41300700001)(38100700002)(5660300002)(86362001)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?aPtVPI/+qnG78339t4PnUT6XY5MD9kdexmgSsktPtVxTn/MLG15XIKPjKg?=
 =?iso-8859-1?Q?qY2FHnIw4huwyXdcwik5qGwAsL/REEadKpLa88bNQ0A0688VGkJBwUZ3A4?=
 =?iso-8859-1?Q?igGqi4bgid80AJZfvHq5esHk1G1ALo8xrt5wmlov9OxiulFtDs/O8m4axD?=
 =?iso-8859-1?Q?jr2kyAT02PgzhvlmdUCkkvITfvqeehHjX82Y4MQjuhcwoPVQHq4VskssCo?=
 =?iso-8859-1?Q?5zDpCOMTpkEv5YS6f/jEfsIY8tno/BT7XGim6enNIefgY8VEEhozIQyGMY?=
 =?iso-8859-1?Q?jdShDmFgi+QpwmdlIdOMH5OtShyP939wJtS2V8ZS+PUpSxQQwyrde2DsOe?=
 =?iso-8859-1?Q?0VOUvSVlEf1FBKjVsLKclyizXJioD4IysqT1vxxYgTJR10KvcXiZNwn1IJ?=
 =?iso-8859-1?Q?Kr/4Gwyf1T8ngEGGwWZA32GKzUMvP9uSMcmzkErM0nKTkQ8IeNy5PM26bz?=
 =?iso-8859-1?Q?mTiV+S9Hm5PFRA2HQb+9/T5D3MwYt4SKy13sbvAkNUetdjPVnocWgJFijz?=
 =?iso-8859-1?Q?nny7Cuc9LSfdKe6j9hZYG9uCQYp/xAw918WbYOy35vfgGKP7XR5u3scgu9?=
 =?iso-8859-1?Q?FDFDa1gAbltBJ8R3a8wXgyzbqd91jIKcfYPYs6iKHvb/No2fvzxPB+ZlKp?=
 =?iso-8859-1?Q?7oUzPtB+JJTNVcDYTBcZ1cGHUjmPco4/AZvqzSqT1D7/7plUfxrfyoxrRC?=
 =?iso-8859-1?Q?+Q8Zk4NIfWm+E8WLlwSI4y3t/UEiZ9FkLCtY4YUOU5Q589820WjR3SpkCi?=
 =?iso-8859-1?Q?RKBg9lAagZkiBZwQrRrG2KcSWucda246/pfi/VrFaEhQGMZ7jlSkU6gjW4?=
 =?iso-8859-1?Q?d7nYJBVNVBwVGE2bPswQMhMPOxpqmWI0r7HL+je5eOO0rlI2NdUQpe0G4j?=
 =?iso-8859-1?Q?4Vw1zhgiXgl1S+OrNtw5p7Gha/HQmhY0Uhinlu5/6zxVVYLyX/6N72QWAK?=
 =?iso-8859-1?Q?6z6q5b6rZ4yihvtMd5SyyLBO4cphStivvnE8oizlx7FpKEvkobmKzf1RXp?=
 =?iso-8859-1?Q?KU+gqme0C8tHPZrDx020MGSFuMDOz2VO36X1nhdxiq/ljmhHzA2O+tpwpO?=
 =?iso-8859-1?Q?NmjPtNO9x0rXtt/Kb/1e1Ej0irmZj6t9g4takzh/4VzEc3AMy+y+lHtvO7?=
 =?iso-8859-1?Q?jo9XMotwzU9yuR5rrkFsTcdG4zzycF0b5y3TUcOkv+nW45znHU2UFHTIE8?=
 =?iso-8859-1?Q?eW73/ZJoaO5T7kcIFBw1XcmZtrok9DNJNbPutwOiKQ3LDHRZkba3U1ig7F?=
 =?iso-8859-1?Q?rDIPiCXE3khkCkRTzlyspHJQl9pnhZmp6Xb4oDN7a42/RqG06s8HI1lyA8?=
 =?iso-8859-1?Q?pk0pOzL3Pm5+0nGzGiCXQ5IdSDVnUbcSCLqcyp/G81i3tliUvHfPgeBm21?=
 =?iso-8859-1?Q?tbxLhG15XnYwx3JNcQD5UrflSEhYgVsKyOvDPrGFUQOonLmRI7cXK5sfd7?=
 =?iso-8859-1?Q?Hw3rQXBX7chE+98n3BlH1JKCA8uf8aJ2Bu8aZ+wzKBPY4+9MLNuAc5B8SZ?=
 =?iso-8859-1?Q?brCYDlvHb0L5ACspSDaMYJwvq9MmYlPqBS1bsB+q74cx3CGcqDqnITnC0H?=
 =?iso-8859-1?Q?ghAV3QXVC2L8vE3yyycQqOyarvzNk+8AefdXsAYTxi6Co2hXy+Fa0ltd16?=
 =?iso-8859-1?Q?RaXxLO31vSmbXt+3bknJNBvLdWXHa+C8xV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d48869d0-a7c7-42b3-c5af-08dbe5b1deb6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 08:07:11.2415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fAmLY17KXTUU8Gr+PESROhTNQTNp+FNfgWQ/mq/Y8ww7XurpGd0Fjut0kWQxVjqpgAS7xqBm8dNCM6+14DjoxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6562
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kabel/linux.git realtek-sfp-work
head:   a7931b1e7b8bdade3975606bc26446fdccc6a40e
commit: 1b9d6e195efad14934464c6d5285a3949ed0d898 [8/20] net: mdiobus: add support to access PHY registers via debugfs
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20231115/202311150909.QLgwVtTa-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231115/202311150909.QLgwVtTa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202311150909.QLgwVtTa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/mdio_debugfs.c:53:5: warning: no previous prototype for 'mdiobus_register_debugfs' [-Wmissing-prototypes]
      53 | int mdiobus_register_debugfs(struct mii_bus *bus)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/phy/mdio_debugfs.c:75:6: warning: no previous prototype for 'mdiobus_unregister_debugfs' [-Wmissing-prototypes]
      75 | void mdiobus_unregister_debugfs(struct mii_bus *bus)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/phy/mdio_debugfs.c:86:5: warning: no previous prototype for 'mdiobus_debugfs_init' [-Wmissing-prototypes]
      86 | int mdiobus_debugfs_init(void)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/phy/mdio_debugfs.c:99:6: warning: no previous prototype for 'mdiobus_debugfs_exit' [-Wmissing-prototypes]
      99 | void mdiobus_debugfs_exit(void)
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/mdiobus_register_debugfs +53 drivers/net/phy/mdio_debugfs.c

1b9d6e195efad1 Marek Behún 2021-05-31  52  
1b9d6e195efad1 Marek Behún 2021-05-31 @53  int mdiobus_register_debugfs(struct mii_bus *bus)
1b9d6e195efad1 Marek Behún 2021-05-31  54  {
1b9d6e195efad1 Marek Behún 2021-05-31  55  	struct dentry *dir, *entry;
1b9d6e195efad1 Marek Behún 2021-05-31  56  
1b9d6e195efad1 Marek Behún 2021-05-31  57  	dir = debugfs_create_dir(dev_name(&bus->dev), mdiobus_dentry);
1b9d6e195efad1 Marek Behún 2021-05-31  58  	if (IS_ERR(dir))
1b9d6e195efad1 Marek Behún 2021-05-31  59  		return PTR_ERR(dir);
1b9d6e195efad1 Marek Behún 2021-05-31  60  
1b9d6e195efad1 Marek Behún 2021-05-31  61  	debugfs_create_u32("addr", 0600, dir, &bus->debug_addr);
1b9d6e195efad1 Marek Behún 2021-05-31  62  	debugfs_create_u32("reg", 0600, dir, &bus->debug_reg);
1b9d6e195efad1 Marek Behún 2021-05-31  63  
1b9d6e195efad1 Marek Behún 2021-05-31  64  	entry = debugfs_create_file_unsafe("val", 0600, dir, bus, &val_fops);
1b9d6e195efad1 Marek Behún 2021-05-31  65  	if (IS_ERR(entry))
1b9d6e195efad1 Marek Behún 2021-05-31  66  		goto fail;
1b9d6e195efad1 Marek Behún 2021-05-31  67  
1b9d6e195efad1 Marek Behún 2021-05-31  68  	return 0;
1b9d6e195efad1 Marek Behún 2021-05-31  69  
1b9d6e195efad1 Marek Behún 2021-05-31  70  fail:
1b9d6e195efad1 Marek Behún 2021-05-31  71  	debugfs_remove_recursive(dir);
1b9d6e195efad1 Marek Behún 2021-05-31  72  	return PTR_ERR(entry);
1b9d6e195efad1 Marek Behún 2021-05-31  73  }
1b9d6e195efad1 Marek Behún 2021-05-31  74  
1b9d6e195efad1 Marek Behún 2021-05-31 @75  void mdiobus_unregister_debugfs(struct mii_bus *bus)
1b9d6e195efad1 Marek Behún 2021-05-31  76  {
1b9d6e195efad1 Marek Behún 2021-05-31  77  	struct dentry *dir;
1b9d6e195efad1 Marek Behún 2021-05-31  78  
1b9d6e195efad1 Marek Behún 2021-05-31  79  	dir = debugfs_lookup(dev_name(&bus->dev), mdiobus_dentry);
1b9d6e195efad1 Marek Behún 2021-05-31  80  	if (!dir)
1b9d6e195efad1 Marek Behún 2021-05-31  81  		return;
1b9d6e195efad1 Marek Behún 2021-05-31  82  
1b9d6e195efad1 Marek Behún 2021-05-31  83  	debugfs_remove_recursive(dir);
1b9d6e195efad1 Marek Behún 2021-05-31  84  }
1b9d6e195efad1 Marek Behún 2021-05-31  85  
1b9d6e195efad1 Marek Behún 2021-05-31 @86  int mdiobus_debugfs_init(void)
1b9d6e195efad1 Marek Behún 2021-05-31  87  {
1b9d6e195efad1 Marek Behún 2021-05-31  88  	struct dentry *dentry;
1b9d6e195efad1 Marek Behún 2021-05-31  89  
1b9d6e195efad1 Marek Behún 2021-05-31  90  	dentry = debugfs_create_dir("mdio_bus", NULL);
1b9d6e195efad1 Marek Behún 2021-05-31  91  	if (IS_ERR(dentry))
1b9d6e195efad1 Marek Behún 2021-05-31  92  		return PTR_ERR(dentry);
1b9d6e195efad1 Marek Behún 2021-05-31  93  
1b9d6e195efad1 Marek Behún 2021-05-31  94  	mdiobus_dentry = dentry;
1b9d6e195efad1 Marek Behún 2021-05-31  95  
1b9d6e195efad1 Marek Behún 2021-05-31  96  	return 0;
1b9d6e195efad1 Marek Behún 2021-05-31  97  }
1b9d6e195efad1 Marek Behún 2021-05-31  98  
1b9d6e195efad1 Marek Behún 2021-05-31 @99  void mdiobus_debugfs_exit(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

