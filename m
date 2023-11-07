Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4C9328AF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 16:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kV+t2rNM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699374298; x=1730910298;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=phIq/iHOuKzx8LEyy9MDCswH/aVpDyuGrDwoRBeIKew=;
  b=kV+t2rNMt88X4SHSdu1CgRfXeL1tMn70SlDNjIFM15Dr3k31V/MKYMf5
   mSAtT0tiFML9PaJ8ruDWs6ol5p41I+1mSKzy9LcLFiMgBzCwxrYwxtlOd
   XNCtoZq+mq+GsW955MK8GvzHksS7CLlYiKzOhr0wReSPNQqIwU/X8lgw8
   V2PxYUG7cDHSnw+1dgfoOGNDUWyyMmtfoD1KjAdbL53SMMFiklbQ0PXva
   R10e6O/gEV7zqEGWp++5eFsQTN5FsBPoH0p/QljpuceMZ9uvWyRq0d5Fv
   9br3LBwbQE7Yw8VAFrVwe/y2SdfU9hOqZbMKwWCz7EY6RouEzLv39gyCM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="456029679"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="456029679"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 08:24:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="712615226"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="712615226"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Nov 2023 08:24:57 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 08:24:57 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 08:24:57 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 08:24:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=by/mqjYZWhH1oHM/4kDKWog8i9gdMECQT1IWcm6N1QEgDnmE4xXRUEQsL0CooAExvdbhf8Jzd8uW9jLy8Q4kQCmz9t6YtLukODE1f0h26JhKIFNKxxflsOPV/q3sdLoAmjRO/pjLCNzgxUUq1L5iDvpx+58Ub2WDuFBZW5+0U2UlV/LfZKHNWVXIJYErsJvBEf+LnjSZmM+kKmO+wpBt8jdXjviH1iei9MzTXJv/JbpWR63XjIfKity+V17r3/qtfCDENdZmGLKnW2n87GRCeIbUqsyM1DwcfZ5kQ21fEg1XLXTR2JYXb4nHreXlC7awkmf36LanKKABF2m4dECmBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPnd0oCZvpEhVQzQDSjLlgSQYLmGXupp2ivRoCAZ/NE=;
 b=CO3zRTlhQ3bqmoLS50CI/R/VpanVPCPdYlGAoqGPh0La/V7uW0IoO4bdBuD0bzmNgzrX5nCFonKdfXrPRbhcLPj8wRBEA5rIv3d87DbQzAgSiz/jFAkG4Zy1TTJhaIAuPE6Yn39ucPglHf54PucadosTxYgNftOK2Tcp/rKTrTFVvp8ACqonwoOAw5zLLykSATdcQfvIIfz2j57tvOiRnVjFZEHTcpKhS9a89bBBnyuderUVn+wqjCj8C2E/e35Ph3J80MPEQCwVQ/6sUWKIG5o5Hc25rrypdPBRVboO4rtkmz4NSlfK5vpwe4uka9To69OD8omd1x/nyby6vmRMAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB8026.namprd11.prod.outlook.com (2603:10b6:806:2dd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 16:24:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c%4]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 16:24:55 +0000
Date: Tue, 7 Nov 2023 10:24:53 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: kernel test robot <yujie.liu@intel.com>, Oak Zeng <oak.zeng@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
	<oe-kbuild-all@lists.linux.dev>
Subject: Re: [Intel-xe] [drm-xe:oak/drm-evictable-lru 2911/3055]
 drivers/gpu/drm/i915/display/intel_display_power.h: linux/mutex.h is
 included more than once.
Message-ID: <j7woryfaopndy26jdcsteie5lsacghy74fvw646rxm7eliaey5@4nlicq3xlzfv>
References: <202311070416.8nPv4n6G-lkp@intel.com>
 <87a5rqymy8.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87a5rqymy8.fsf@intel.com>
X-ClientProxiedBy: SJ0PR13CA0197.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB8026:EE_
X-MS-Office365-Filtering-Correlation-Id: 14adb098-2a4d-40e1-6ff1-08dbdfae13b8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8elXuTcw6j6sHbrubb2Guf3zzBzYM2V18Ek6d1Skc/tisfkxQxufV5G7dnUMoFTJaucQKalNHfa83B0+kj5Mbx+AbT2fL8vQRBP+JPsGjm92/NMp68VPBOSCLWcxxbeVx7wQd7LBrIa0q5QdxBo1OvKz0cYLJtjBHHcs+ZJlKE7eVW8yqfGvYzffwhw3L5SnysbvTGfOltsxiPbbt4fP5LCOsj321P5QYMVD7nzlsfXBHGMc+c0rEBAyysb4nO2+jZOJlVKj4KzceMfNMH/KvWbSwrN3PtM26DZRA3d7V+4N5ZCu7tp8v/2fiwEBZ0otrmMFqpo+oiG5sApkpHU0y+BHi+SoZRq14fAUVvKNCy3j+olBNNw9wtG5Z019k4VfFRbRsu/YTkrnoWJlHMwpYnUVDnopDN7SYAhC63kk0D1qN24S4meBexdN8pLzNqANfWEg9dQdW6Ga+kCeQRPQHV7hi0QG+iAtXVPnr9TpsL8cjR7pJ51Rnl5R2VBazxo9D6Xq7FhTm3LGV+z7d7kxhTx3zq+VCiPgWW9vP3CkuSs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(6636002)(41300700001)(6862004)(8676002)(4326008)(86362001)(8936002)(6486002)(966005)(54906003)(316002)(5660300002)(38100700002)(4744005)(2906002)(26005)(82960400001)(66946007)(33716001)(66476007)(83380400001)(66556008)(9686003)(6512007)(478600001)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mjLi3jvFxRmJa6JY6Im6QVJITUFVptVo4Hoy++9tLqqhBJCEh6oEGc2H8Dvo?=
 =?us-ascii?Q?qoKWG9NhDDVI4fyUo8YHE1Y8xy7IQpox8rhfWa0BRRLyxE+7YOaQge5zmpS6?=
 =?us-ascii?Q?cCdDwdIA+PoSpdIesxoPwFDjA1dQF9mIosia9w+JS+ArmNYYuGy2ubXh+ZPQ?=
 =?us-ascii?Q?BhRwmar5Ua43z557mNrUZve8FtekDQr7a5Pf2Np2Iv1tRjnAEIqbyZEuhePa?=
 =?us-ascii?Q?lgYthSOUSXt/CZ15Q85ZWPxe3VcBzK3Fv9lkXULkIg0kLBC/p5dA4Qe+qdX1?=
 =?us-ascii?Q?yjJXgTkFJ3lIoXOTQX/GW5NoawxZmQhG20j+3dJD7CoCXj40JnRHQg8pGxbL?=
 =?us-ascii?Q?fnq/2IP+mvYaLgjQ67kDIOrvbNPHdjllZQx8FjTlOu4BQARVKa7fET59HoZ/?=
 =?us-ascii?Q?tXge+DHKpmXmHsagWeV+lRYjg8+EyqKV/TVgDWxiX45qOPRd0MB/daylhJqV?=
 =?us-ascii?Q?SOcLA4S1sKHfTlt8DXLrBo/MYDOd8fvie1d7xdYOou47ACBUVpuTOarE/yJu?=
 =?us-ascii?Q?ZuQXNGk9yvV9dhjE1GqfW2QBNsQpY69Kz5nOIEqMcaPV0tDcMMZf1CibrOa1?=
 =?us-ascii?Q?HzKNeiEli1/csAViR69h3KAhLAHr8KS0qNM/5eCehAP6hMs9x8HkHZV2s7pc?=
 =?us-ascii?Q?LtJasyQ/OGmwK5w6tLEDWWiis7ckw5Xtu9TXcpY4HE2NbkbdwfhqMuEeGNVS?=
 =?us-ascii?Q?c8OSEQ8HRw5SlqQUuInVKyxBNpfmJSGDfJd8Swc46LsF4uFsa8fd+Xo1VwN7?=
 =?us-ascii?Q?WkJ5r9bsgT5IJnWtqyXsNsQBwlDUSnn9P9qjm0ffeZxyNhk+N4jzUvJUMEeK?=
 =?us-ascii?Q?h39zqlfBofeAL9qPxVu7UFy/Y5VTilgh9O/rgJDixPGh/KXKG3IxEdL3qVvN?=
 =?us-ascii?Q?fGmkvkHXF4TO7AstEuhhiunnb2sSHORQX0FyNCmPJ8iO+fpZOzJXQJxdV0X4?=
 =?us-ascii?Q?l5mNC/8w//hYTq/n4OsdXP84u/ceM91S9kA/NHZgKuKFSx6nC14d3DJOd6ui?=
 =?us-ascii?Q?6YytYFcEXN6wsIqg+ZJzKlSNpG6FcfqfQKvKA6gcmY9857Y3hP06vPuVfDcv?=
 =?us-ascii?Q?4pRKf44fCVvxu43D27QsDdleK2Tq/fia4tYbMCIN21DDbV4KecGwbwBCPm6b?=
 =?us-ascii?Q?LBaOeD4nry/9vSYunCIC+5YJr7zbkuyhZiJvBO+0Hlg057YllNK73kQjQNvv?=
 =?us-ascii?Q?qQvWbIf7F8FywzBrCFs1jnqRkygzqxf8xuHpx36N86s3pul5sATOMc+cCgs9?=
 =?us-ascii?Q?oZ6dfo8AJbJHvn8CSpV5pPYeadXDsPzlSV7r11HqMe9259K8hqeehX/3k8hc?=
 =?us-ascii?Q?gaAc1aKPto6V3ODZ9C8lbFBwNWdMrAi9c2y3XdFo2gAmzwP83CpuwcoXQGsy?=
 =?us-ascii?Q?Gy7RtPb7P8OIyjQBNY6rpHFY9Zi0a/f7mxjfAzzqHETLoyEKkZh9INZdgR47?=
 =?us-ascii?Q?8Dd8l3wWhyn9aL99sdkDmA9AzdUIOck9z4wTNKBjkdYAwWS8yO88D29PXjhd?=
 =?us-ascii?Q?zKz3KimDlOKxku5Bbb1iqq+X3jw8aHKn4NmNEpMoLysg2Gxe14Lr7N/HQ7i7?=
 =?us-ascii?Q?U78u4DtPYEA5CAkkPPkeixzn35q9mu/8qSSLcD/ICpjqnvbJHhJ+TYYZB6yH?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14adb098-2a4d-40e1-6ff1-08dbdfae13b8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 16:24:55.4196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: syvnLEYZXPd4D4zldYBuj0YrBNjFVR/mNmN+iaGD6d0jcAWkn9c0XgoF2oQFfItQmyXUo9oNAFDZgBWRYpxQrVy4KTT6USRpEN4ZtQ7X1vE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8026
X-OriginatorOrg: intel.com

On Tue, Nov 07, 2023 at 10:41:51AM +0200, Jani Nikula wrote:
>On Tue, 07 Nov 2023, kernel test robot <yujie.liu@intel.com> wrote:
>> tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git oak/drm-evictable-lru
>
>Why do we have this stale branch? I don't think developers should push
>their branches to xe/kernel.git but their own repos instead.

agreed. I just blocked branch creation in gitlab so we don't have
those accidents anymore.

Lucas De Marchi
