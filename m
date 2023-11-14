Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC015688
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Nov 2023 01:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lGq2HXga"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699925645; x=1731461645;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=MkkpyYlIaEkJHBFu8O9M57Lwg7sGDn+XmZsDWTAm+ro=;
  b=lGq2HXga4MET4gYAkEvp+8ibAqa9KUib5oH2q4OWi3Qha1Vf/MSnT7+d
   fB0RLtMdXvjTPdvXSZ/yCc8KlQJXx3OpAcGhWDBUg4YBS0gwzWOqgIGjO
   1GWu/NgsfesmxUtFDHetnX2DwL/lxg7R3Qji7sAvBaDQ6tJKItvYgdijc
   yzybTIXDKZOzpeLQE/pEMH2zWnKCrZnMd6J2+DxbkBbmHwe3NxoH1+f12
   +3tEm8/MbHdT4tmR9vs8AoV37fR98VuU5yMBESbLNaa6I/bq/hWcTSVB4
   nCkaiP6AdXLYEaqxWDlMI7QnasI3H+vtL0kIvgd9RrE58k3eG4nHnraWk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="9183664"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="9183664"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 17:34:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="12629436"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Nov 2023 17:34:04 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 17:34:03 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 17:34:03 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 17:34:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BkD4hUT11UXn2DBZIcu8mAOil0r77FYAdfFtKJP48TvUP3an7xx2xoX4EqYGVCcpLma9Lma4MD0rpsa0W+WuxVcyFo5wPMCXzibjD/EGVIwH2KEEzfzSlv0HDBFWClY6WNuOLQq+NUE13mGvSj9M4EkFZ8QJzdWtND4X5gjaUOjh7uYzhm0bOrLmptJvS+95v1TAv5pYYdnuUe9ld3WoS+OW/0K7hYggdaM/qgbd73o3OBCgCj2vL/6Nrh/2vVYq/EXTsBAnXnTC8fbFAfkDWudRc8An/0cRqqV7QbcmdhaHXH6UN6FN0deg5eWO5zIGnhaZq0va0IY5UsfVD19uWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UPa6tc9E2RJUOa2L3TTfA8u09FHPZECK7czCQfEy2IQ=;
 b=WePPD7qNr3xCLZX9epEF62BSXXmoSAPvZP24nFf523TMRXlgh/i2YZm8jKm/FroMGsw0pjO8lLzUKaod7oIldIQCPfBbvPL83Ke5kQT3WWc/Gwnp4FTeksRGD/NEXy7DonAqfb6i2TsdMLGD0T7/1k0jqLVdU7Wt/BTUABNva9zjlH92NE61q9RtHcyjYbjKT2gTrF1B1CQN+xZaG9A3aSSiDT7sBLm7i403JAt/vmQ1fh0TiNy63kHe/RIG0CufKRE09QTvdkID0oNH5bUoO6X/SlCKSD09yR/1y34eDwtq4T8/rpyjsFisfBLCFG96/jDabksJQSRel4ERpa/C/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Tue, 14 Nov
 2023 01:34:01 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.6933.028; Tue, 14 Nov 2023
 01:34:01 +0000
Date: Tue, 14 Nov 2023 09:29:20 +0800
From: kernel test robot <yujie.liu@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [RFC PATCH v2 10/19] KVM: x86: Implement per-guest-page
 permissions
Message-ID: <202311132003.c5QKfbEI-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231113022326.24388-11-mic@digikod.net>
X-ClientProxiedBy: SI2PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:196::14) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SJ0PR11MB4894:EE_
X-MS-Office365-Filtering-Correlation-Id: c6b23301-1a6c-4a49-8b20-08dbe4b1c70e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nu4CiwoYz37olxt/CL+tsqKrdj0vJ0fySVrZjUo3Qi8JJiN2FqyqFVUVF07pQpyzaZr2rBuplHpiGPqgazsBxSNgiJqcEm1Pq8enKNa8vpTk/0h3B+uxw7OJ5mSd0OeucSnZKBBJa6BNRjhJnt5sCVUpNSu62XFb/oGNfIW/mfF1lIq4q7MbxCgbtS8rIg8gIYAUJX8Vpz9cfQ9Q8PJZqZOGYo6nFojMlpoXqw4v/OE5aCX3jUOXHYFeBUbLexrcpqRZAX0IB1L+/wZWMs3aoeEnlbM7229BxIpk2MrTARki5eBng6ZD/co+MUQZ3IQzAMHYQLpnrkrwiidVqetrq863aWQN1wbPA804lJdQBT0/OuAkjMWvLBvfMmkUPnYnM6PVBeleajcxYL5sfSVDWHL/ZsXV8EhAYukwtuHzwLvkx/RXS1LP70eeiau5z+e7aWzgHYAJ8zON4D0nT7KrRPEv+mJRO8mFP8wiJvnpKfqqSQcuq96wv8sv5NasgS466p0It8natul3oaVHexejs56iiGx+YSVXrgAiPC34+PnYNxjuv0s1nbBTTSbFFKGoxw8//EGaovAzJTJNrDnR58+LJ9cSXtZgUT6lEUsICO5I/SFh0R7nN68yQFERcI1tS4YoQo9j72QroJpRxnpzbQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(230273577357003)(230922051799003)(230173577357003)(1800799009)(451199024)(64100799003)(186009)(66946007)(6916009)(66476007)(66556008)(316002)(6486002)(478600001)(966005)(6666004)(86362001)(5660300002)(41300700001)(36756003)(4001150100001)(2906002)(4326008)(8676002)(8936002)(38100700002)(2616005)(1076003)(26005)(82960400001)(83380400001)(66574015)(6512007)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1KU+en1Y/MOpxIFGdpP9+J1821X8feD8qEZvqO2Z+sAjWRf7YuH6gifF67?=
 =?iso-8859-1?Q?um/QridOd8bV1j9wWybWb47yRX6wOFTPc8CHkPyyHBqu2X5lZgTqSV7kdj?=
 =?iso-8859-1?Q?cqWeZvODIuHygjqIpYQbSduMs5oMoPxz1/ZtcdfKQubJz07H8bcTtrixVC?=
 =?iso-8859-1?Q?2N6ap+1v7ufO5JCEU6DYQyph9ufOke3MB48xNItFwyaCOXzWZ3hPA0kb7o?=
 =?iso-8859-1?Q?+ppet6pvjJBBxZwaErLL0egKGLEld176TEKVhe3ANg1CpBbdYCote2nrpE?=
 =?iso-8859-1?Q?PHkr5K6QIyzBsT7WGENO5MdFhqt/gWRRsxqBhWzEMdxCbzYsw7HMFiLVwn?=
 =?iso-8859-1?Q?z87Yf4ERm4BkAQxJc6WyjNNrjZ+z3sH03E2FMo66zsQo0q4SzFk+k5K/X5?=
 =?iso-8859-1?Q?cbk4wuCTB1Cz3iHuR5jbEm84MOEoVolFC1Yubk/qjiNUyI0Hq9GnOnFMt4?=
 =?iso-8859-1?Q?q4u/XCaZmMce7OzxByosd7gYn65/cxERm1Px4Q4D4hBFV02cuvwTKulA3E?=
 =?iso-8859-1?Q?G7hV2A4ZKazC956yDH8mTjBQ4UjXiqJshkUVHRMxJOGVzAfB7vYIXCoAoN?=
 =?iso-8859-1?Q?93iztMvZ826Hw1T3+Pz7FVj6+vMz9Pnj5AJgbQGKPbbbbTBsDNrE0Dw1c1?=
 =?iso-8859-1?Q?wgwzAZDdfXkwfMunb/qDSgvjWREqLKG3IJOVUonfzpb1/nBe7qru9C9H1Q?=
 =?iso-8859-1?Q?2DY6ImVMzjrHEOgPfLR7tbXkDt07YRogt9izx3kD1jRWhMgHvmCF/dDWWY?=
 =?iso-8859-1?Q?k2FGuj5uVNRinPmCKmhg5ChlR0a5pgUpuw/md1mQ/VS1KJqEAXzpq5FcA+?=
 =?iso-8859-1?Q?/un85EYbEE8QvRatZqzmdPiXE7EFWIF1fs6xFZwDZ+hWKRRjRCMlphbVmL?=
 =?iso-8859-1?Q?FwEdGGiYo35hEA/qrSzGpo/DVlXMDKl4Rbk5udwLMbJ/AbZenRKMcf/Xdr?=
 =?iso-8859-1?Q?MakqML63Tr43lGEVF/Ldjnf/iir3B8+S3ftJlDUILfY4DJPTst1d5RqcHp?=
 =?iso-8859-1?Q?GOTQkAQ95/B1ToXks20rb5tLBmXNwER7sxuVpcU3G4vFoUwZ9BxxM8ewDw?=
 =?iso-8859-1?Q?xNoBOI3tX8sHJbo9D/yTojUjn5C0dME88gEsZeiD1tFSaTPF1Rf5gfiFm7?=
 =?iso-8859-1?Q?cLaOfdq5Mb5jmxL9cLS+5vjEwDOCNqRyghhbOcw+YCufxzHBPMFnZmlOk2?=
 =?iso-8859-1?Q?vSliT8hqXFRooo4oeRsm1AF/5IqD9uPkdJoThXxbWfOBiO8Cjxo1UTIQ2j?=
 =?iso-8859-1?Q?oRu9o11a5QhQvqTShgwlnuBIIBLqOJdIMMfQ9SuVsHZ+rv6PGewdbBoxTC?=
 =?iso-8859-1?Q?kONCzP+gEPEXT7UtnqpoBhJ62qvMOvAt2foloV9TAZfwznbWr4Y7bdLGap?=
 =?iso-8859-1?Q?nmSjCuCPnFKm99qmrf4hnZZ1J+mHJc5E2Ipm/R8LIAS3eZlRY+QrJ3sOoZ?=
 =?iso-8859-1?Q?h93GYrTRj0g5ci6iE1v9GGFNUIr3sfy5GzYVnb8sAI3wwfdxayuzoOk82G?=
 =?iso-8859-1?Q?4w0lrTYIykcNOqnphsrA6wySNYdno4Pmj0gSLIygI2VGdMES3CTxUjTMbS?=
 =?iso-8859-1?Q?MTIjkpN+4L1yqMjIteaPVxBNh73uHZJE37F2O9VmeTCDdt7F+nhUy3ud+F?=
 =?iso-8859-1?Q?F0Qkrsn+By2HeXZkMmjOTTVSKT/Etzrdmh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b23301-1a6c-4a49-8b20-08dbe4b1c70e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 01:34:01.0635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4qud9hM90Iq9auDvmAq7GjA5hr+lMHq225e3rybEuxB7fq8pv3f29kTtOFTH4KBoOx+nvUEVJJ8N0vmA5XBnXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4894
X-OriginatorOrg: intel.com

Hi Mickaël,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 881375a408c0f4ea451ff14545b59216d2923881]

url:    https://github.com/intel-lab-lkp/linux/commits/Micka-l-Sala-n/virt-Introduce-Hypervisor-Enforced-Kernel-Integrity-Heki/20231113-102847
base:   881375a408c0f4ea451ff14545b59216d2923881
patch link:    https://lore.kernel.org/r/20231113022326.24388-11-mic%40digikod.net
patch subject: [RFC PATCH v2 10/19] KVM: x86: Implement per-guest-page permissions
config: x86_64-randconfig-013-20231113 (https://download.01.org/0day-ci/archive/20231113/202311132003.c5QKfbEI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231113/202311132003.c5QKfbEI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202311132003.c5QKfbEI-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/../../../virt/lib/kvm_permissions.c: In function 'kvm_permissions_get':
>> arch/x86/kvm/../../../virt/lib/kvm_permissions.c:74:20: error: implicit declaration of function 'kvm_get_memory_attributes' [-Werror=implicit-function-declaration]
      74 |         kvm_attr = kvm_get_memory_attributes(kvm, gfn);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/../../../virt/lib/kvm_permissions.c: In function 'kvm_permissions_set':
>> arch/x86/kvm/../../../virt/lib/kvm_permissions.c:91:13: error: implicit declaration of function 'kvm_range_has_memory_attributes'; did you mean 'kvm_mmu_init_memslot_memory_attributes'? [-Werror=implicit-function-declaration]
      91 |         if (kvm_range_has_memory_attributes(kvm, gfn_start, gfn_end,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |             kvm_mmu_init_memslot_memory_attributes
>> arch/x86/kvm/../../../virt/lib/kvm_permissions.c:100:16: error: implicit declaration of function 'kvm_vm_set_mem_attributes' [-Werror=implicit-function-declaration]
     100 |         return kvm_vm_set_mem_attributes(kvm, gfn_start, gfn_end,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/kvm_get_memory_attributes +74 arch/x86/kvm/../../../virt/lib/kvm_permissions.c

e677181e18929a Mickaël Salaün 2023-11-12   63  
e677181e18929a Mickaël Salaün 2023-11-12   64  unsigned long kvm_permissions_get(struct kvm *kvm, gfn_t gfn)
e677181e18929a Mickaël Salaün 2023-11-12   65  {
e677181e18929a Mickaël Salaün 2023-11-12   66  	unsigned long kvm_attr = 0;
e677181e18929a Mickaël Salaün 2023-11-12   67  
e677181e18929a Mickaël Salaün 2023-11-12   68  	/*
e677181e18929a Mickaël Salaün 2023-11-12   69  	 * Retrieve the permissions for a guest page. If not present (i.e., no
e677181e18929a Mickaël Salaün 2023-11-12   70  	 * attribute), then return default permissions (RWX).  This means
e677181e18929a Mickaël Salaün 2023-11-12   71  	 * setting permissions to 0 resets them to RWX. We might want to
e677181e18929a Mickaël Salaün 2023-11-12   72  	 * revisit that in a future version.
e677181e18929a Mickaël Salaün 2023-11-12   73  	 */
e677181e18929a Mickaël Salaün 2023-11-12  @74  	kvm_attr = kvm_get_memory_attributes(kvm, gfn);
e677181e18929a Mickaël Salaün 2023-11-12   75  	if (kvm_attr)
e677181e18929a Mickaël Salaün 2023-11-12   76  		return kvm_attr_to_heki_attr(kvm_attr);
e677181e18929a Mickaël Salaün 2023-11-12   77  	else
e677181e18929a Mickaël Salaün 2023-11-12   78  		return kvm_default_permissions;
e677181e18929a Mickaël Salaün 2023-11-12   79  }
e677181e18929a Mickaël Salaün 2023-11-12   80  EXPORT_SYMBOL_GPL(kvm_permissions_get);
e677181e18929a Mickaël Salaün 2023-11-12   81  
e677181e18929a Mickaël Salaün 2023-11-12   82  int kvm_permissions_set(struct kvm *kvm, gfn_t gfn_start, gfn_t gfn_end,
e677181e18929a Mickaël Salaün 2023-11-12   83  			unsigned long heki_attr)
e677181e18929a Mickaël Salaün 2023-11-12   84  {
e677181e18929a Mickaël Salaün 2023-11-12   85  	if ((heki_attr | MEM_ATTR_PROT) != MEM_ATTR_PROT)
e677181e18929a Mickaël Salaün 2023-11-12   86  		return -EINVAL;
e677181e18929a Mickaël Salaün 2023-11-12   87  
e677181e18929a Mickaël Salaün 2023-11-12   88  	if (gfn_end <= gfn_start)
e677181e18929a Mickaël Salaün 2023-11-12   89  		return -EINVAL;
e677181e18929a Mickaël Salaün 2023-11-12   90  
e677181e18929a Mickaël Salaün 2023-11-12  @91  	if (kvm_range_has_memory_attributes(kvm, gfn_start, gfn_end,
e677181e18929a Mickaël Salaün 2023-11-12   92  					    KVM_MEMORY_ATTRIBUTE_HEKI_IMMUTABLE,
e677181e18929a Mickaël Salaün 2023-11-12   93  					    false)) {
e677181e18929a Mickaël Salaün 2023-11-12   94  		pr_warn_ratelimited(
e677181e18929a Mickaël Salaün 2023-11-12   95  			"Guest tried to change immutable permission for GFNs %llx-%llx\n",
e677181e18929a Mickaël Salaün 2023-11-12   96  			gfn_start, gfn_end);
e677181e18929a Mickaël Salaün 2023-11-12   97  		return -EPERM;
e677181e18929a Mickaël Salaün 2023-11-12   98  	}
e677181e18929a Mickaël Salaün 2023-11-12   99  
e677181e18929a Mickaël Salaün 2023-11-12 @100  	return kvm_vm_set_mem_attributes(kvm, gfn_start, gfn_end,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

