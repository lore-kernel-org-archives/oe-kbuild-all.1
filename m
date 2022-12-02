Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC627486
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Dec 2022 21:03:45 +0000 (UTC)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
	by m0001303.ppops.net (8.17.1.19/8.17.1.19) with ESMTP id 2B2Hk6WE011221;
	Fri, 2 Dec 2022 13:03:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-id :
 content-type : content-transfer-encoding : mime-version; s=s2048-2021-q4;
 bh=9zj781yxlipScOkntydsXxzs31xwgFuh9Jj6ny5mCYE=;
 b=FKNKDpNFZWRQowHhviHE/J4X+1F33zVc5/pfliyhMVKk+NF1F7eltFS0MtQRmXO9caUB
 zjqhn5rsDs1t3DGZLVC6BEtzUIJ+ssLAN4o9pHLwwBDVr+fPro3bEr1NJQvT375HlLXS
 4vCP8aX5MCtuAbgavrE8UagzHtSlwsSOO6jxMDvFSR3mkD4hKBwtkjilUuIxhNd7yali
 KTYJlOzHrXb6Cv4E4PXI05R1noGZSxFaYdxZyUQMR87ngGWBBQa/VT1zohcwrZ57B/YI
 6cmxMUfNTQ3dsCwXzvrMep1VolCdL+kpN//z6YDRKV6LNbJhYc9nTsaNfLNcFX2XIcSi oA== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by m0001303.ppops.net (PPS) with ESMTPS id 3m7p21hg8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Dec 2022 13:03:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V045ivDmW4DYss2x/iDm9Jx7SyzLwtity+D7pa4WTGEGi0hnhtg9qh5P/CITdkBcxpT/foRFQjEG/JnqM2IM1l9JiCgM4oFtfRnSj2QH37aETiV4cPZBcmNQpEdWjYwzl9HLSG9PhQuZNexhWX4UvTh9O1anNmpF0ugGaZVZbwBPPOwrcaYrzm58CD++jn52ZnJqW7qOKYheZeSan1oZk+Kerg0Z/1ZO2lw4GZXU6IjFIB7oWZ3YGg/9jlrR1/O6cPL0cyeR5xA8XgRCODuvb03A/UVRecgJL1x09mpmJsR+QFp9k3AL9/bdAjttktY8aCtf7v2Hw24jG/HqCIxIBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCKN9Poy2Vu/6hgNxKvK/j0IOv8jDTnUe/mcrwmAi4w=;
 b=ARvA5t1E1bVhF3A/YLnNRZkThHV9lHfdMWkF7P487x7XeWHDXp8RvDmhYLk956JvBnmoF175mNiB5vm+hTD2pqs/n0vZ1cNBVxTdWdGm1c8QEhl6rWWm+Yfw3+UWUiokJmzkcxOrGS4Qg6VwGPyheB9XJ+sEVs2ARBqMknlKNGvY42vTqVvZG+AuPYh12Pe7yTFME0KNpZqWHroi7ryhGIahQHRk6tKBMmetUnhv9pAzspqsPjHS48Qpv89dP5CHQaXg4tjmav/mhOtTeWWHTTzM5Cj6sz7HngxIUDa40Cg+acNDacmR7tPkYtV9wlI8m0hlXMI5QzsxBAXq3RWkzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by DM5PR1501MB2183.namprd15.prod.outlook.com (2603:10b6:4:a1::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.21; Fri, 2 Dec
 2022 21:03:37 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::e563:bbde:256f:5d0f]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::e563:bbde:256f:5d0f%5]) with mapi id 15.20.5880.010; Fri, 2 Dec 2022
 21:03:37 +0000
From: Nick Terrell <terrelln@meta.com>
To: kernel test robot <lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        Linux
 Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 2415/12617] ERROR: modpost:
 "__ld_r13_to_r21_ret" [lib/zstd/zstd_decompress.ko] undefined!
Thread-Topic: [linux-next:master 2415/12617] ERROR: modpost:
 "__ld_r13_to_r21_ret" [lib/zstd/zstd_decompress.ko] undefined!
Thread-Index: AQHZBiWnE7VAP5UKuUOJtiGA1t2OSq5bFssA
Date: Fri, 2 Dec 2022 21:03:37 +0000
Message-ID: <98CD8297-429B-41FE-91FD-3AFE4D5FF54A@fb.com>
References: <202212021651.g6zTJJsz-lkp@intel.com>
In-Reply-To: <202212021651.g6zTJJsz-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR15MB3667:EE_|DM5PR1501MB2183:EE_
x-ms-office365-filtering-correlation-id: 11e0cd37-1b08-45ee-26d1-08dad4a8ae6f
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4MJwBV0p1AYsrtJuOZIsMMoS3mV9D4mAJ+m7bsVpjvI29uxk6Q2Jf5uGhC+j26k2akDO4L4HUsduRlgtIwOUl06Bw/tCutIShOMWbp69mou2cW1t2+OaE0F7nq/02MvhdZdNdhQshDGy2+hzHFgdyOAe09DadYnZw6+wW9TlsI++fLFXHm+Gn8goiUsP+ISmMK0j1eFjdQ768TD+8s865EJpqceqBUD0EsMxMVA+d+iFw8YJD0Ycd5ghPHjkz7PyHpaTymPuTLDHseXsTzhYdibD6cqJZFZzKGijNtzPIjxHyd+qQCFFiIq6iR9/zgFR481AUFLdHeLar8HLKZYIwN8VUUO+wjgyEL8bLg4WMpD37FFBqbTPxVFsTUHYa2ksIV8cPBL9lAzHTRJ99m3N3en5U8AChcGvCERBXUpN/6Rcfi69ZrBHrV7mlG3J757jD0PUq/LALFiGIRrhbS559153uaTjXYntgbBq0e18DRelj8NUgn+vR+ynMllEGfXcd8vnNSco2lT5lvest8gBef5cZxF7DCeO+D4vL8Chr+nbH22LM+OV+2MQfzCEUS7FaJU53bXVnhlkMoOG9yoT/M7ilKeN/LeujpxQ+gFu29BJ8Oso8KYdIi5uvlvHY1NB2qYV4R/fsbYg3zZq7Idd5n4Tmd/blTOzYRJxr8Mhfz4jMptzI/ElOQDo8Ja0XVthGRFwc8VB4jIQqYL9TQiVGoxad3nHkmbFAKVXMfV7jQJ7UEVidZOu5VX5YN2ctWLt/jjo2g9DkG9IsbI/AVjXfA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR15MB3667.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(366004)(136003)(39860400002)(451199015)(54906003)(6916009)(122000001)(316002)(6506007)(38100700002)(36756003)(53546011)(41300700001)(186003)(5660300002)(86362001)(8936002)(6512007)(9686003)(64756008)(66446008)(4326008)(66946007)(38070700005)(71200400001)(66476007)(8676002)(6486002)(966005)(83380400001)(66556008)(76116006)(2906002)(33656002)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?NkoMFto91zduRyEEWkDMxPmqahQsmH4rxreLFDNxJd6UCH2HQd99kkRcbCF8?=
 =?us-ascii?Q?7SfNaZeRN0taYSBoipu/hnsugRk+aJJl8+IwyzKNz5LC8DJVpxkLJ3B2RynL?=
 =?us-ascii?Q?6rqFpYIH8bSQ9wf7sLJ/knglM+tfEcV/9OW6ne0XrMIQYdyux4KYnEDspegT?=
 =?us-ascii?Q?SCq4F42vUG41MMCQbCOUmLs+Z+w6n11TasW4una5eefYxg0fULIb/60horfH?=
 =?us-ascii?Q?Gb4HDpZDIX6Trz7uwtf++cMLdyiubcjXekxJCmITOs201qwSRyKQ2iGWNne5?=
 =?us-ascii?Q?pwaPcSoo4S/CezN3wM7GL9IeUGCf2PUJMZsgMSA8ayQIgTxDEFMBFl5jEes4?=
 =?us-ascii?Q?TZE8JRBL+AzchxGRMqYBgTFU5h65ZbcgTWQIVPfnaIMjDIkHKAuiBeWNaQZF?=
 =?us-ascii?Q?En2Q3z54oV/KakriOci5uyfmUz29oUf+GOwD60tC7R3/90ABR7l0UMo1VwGn?=
 =?us-ascii?Q?lfgntUjm5/qSGGmZhBjBRlA0U5KLe3cxvBpgXEOWY9ipk6nrfKcrW4eg9JSa?=
 =?us-ascii?Q?MVFbQle+zUQKc927bpSpDZB/eiOp6+UuCtkG8n4ckKCBwF/GNCFQKS1yKYxN?=
 =?us-ascii?Q?MMwgahvtK+B5qcETYJkV39b5VXxKxT/NFZS0NlBEQSrrUi84JVOk+VyqRDLM?=
 =?us-ascii?Q?YmnQnWIVCn15iQC+LsLl2BN2cWNmaMYOlacG5wz6/uOxS3ozFUXMEkcRTTtu?=
 =?us-ascii?Q?NbNWLTpQiMUV9I/w6QIsAod/DwGQVTqZAjYRIGMBAN3bfv4n+7cG8482HbgB?=
 =?us-ascii?Q?45tXRHnwR2LUlKB6xgK84nA8qd8rMP3GkJDQY+tEvsmrK/UL61slTPPCnDWo?=
 =?us-ascii?Q?4wVf9nXLUQpnJQirWVhRhNeipOkR5zlrYTnYZsGil6PcapeSYs9rE0ByXKaD?=
 =?us-ascii?Q?l+C8A/AL1rYO94u5NEFW1PY/+mSjnr/AyJ7Eydh9E5u8Wf3GjvVpijHsVLJZ?=
 =?us-ascii?Q?3r5PUYm7BZTVN6jnNQodEK3zmr49GUhVH3V4gH3H85J0zQwBLfn/QaWECXuf?=
 =?us-ascii?Q?F5Jgi95U2E/xssdpDj9DbzTa6azIrvnm+VFycov8c6W1CWGSVBmjMXuGs6yw?=
 =?us-ascii?Q?vWiwfGXpOROKztyFF1sfHL4tGRHD3oJlyWAs8Xa3mJ5oZYZ+kb+IPT2K3PkS?=
 =?us-ascii?Q?ViNlyCeiLWxZVecpFJn6Wl2+ZcvPsmz540fbakqhxn4a6z20KGMxUjZ7lFid?=
 =?us-ascii?Q?OUG8H/YDDWR9NoHJUwh3fj8JmEJK3BI2P9ZCIl+g2aGRWoB9boMzI0i2O64h?=
 =?us-ascii?Q?w5ZV6B+lMIQ5xSnpPUSkJJzcPZMmcwbNd0SUZlSffdTC/mRsLlI+toUy+czy?=
 =?us-ascii?Q?YvpMOaMjK+bcuemzGT+n3NZpTRBGxvAMLcJaeuQuL6dZM3JA7NzJtMQYy9h4?=
 =?us-ascii?Q?C7E6JcSpUQT99WmU1O3kHQWn/JUijL/NdrxbE0y+Rw00H5axjaWKWvKBJaCd?=
 =?us-ascii?Q?oHcD1psZYbeMzTZ7stdAVV2s7A58+USNzR5VI6J4HZAeiXVtarH32GMckGSc?=
 =?us-ascii?Q?BAlzvG36EiKFHoYi+XrrkthK/wSmCG6k5mZaL7laMHbKbfPS2jT5JgZhZjXM?=
 =?us-ascii?Q?TVEI/1wHdooWOm09fouWYYwQgAcZbsoLqXRW+DwuXAIjYmdDQMHWnmggLIzB?=
 =?us-ascii?Q?EQVoIsubSfAX+IAMEoy0GqE=3D?=
Content-ID: <6FF357E48848F742802E039424376258@namprd15.prod.outlook.com>
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e0cd37-1b08-45ee-26d1-08dad4a8ae6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 21:03:37.1835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JZ0d/34fxMm4/uXHDorY/l5gmXrk1JnrES4PkORh0YUwPowRh8g1BKjn40mZSbY+cRCi/gri+kNdBdt9e4BErQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1501MB2183
X-Proofpoint-ORIG-GUID: qftHQq0cxHMMWjQS8K7RpWREj_u1iSJ6
X-Proofpoint-GUID: qftHQq0cxHMMWjQS8K7RpWREj_u1iSJ6
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 2 URL's were un-rewritten
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-02_12,2022-12-01_01,2022-06-22_01



> On Dec 2, 2022, at 12:10 AM, kernel test robot <lkp@intel.com> wrote:
>=20
> !-------------------------------------------------------------------|
>  This Message Is From an External Sender
>=20
> |-------------------------------------------------------------------!
>=20
> Hi Nick,
>=20
> First bad commit (maybe !=3D root cause):
>=20
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   5be860bfc73408bc1a8af9167955e480ecebba84
> commit: 2aa14b1ab2c41a4fe41efae80d58bb77da91f19f [2415/12617] zstd: impor=
t usptream v1.5.2
> config: arc-randconfig-r006-20221128
> compiler: arc-elf-gcc (GCC) 12.1.0
> reproduce (this is a W=3D1 build):
>        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin=
/make.cross  -O ~/bin/make.cross
>        chmod +x ~/bin/make.cross
>        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.=
git/commit/?id=3D2aa14b1ab2c41a4fe41efae80d58bb77da91f19f
>        git remote add linux-next https://git.kernel.org/pub/scm/linux/ker=
nel/git/next/linux-next.git
>        git fetch --no-tags linux-next master
>        git checkout 2aa14b1ab2c41a4fe41efae80d58bb77da91f19f
>        # save the config file
>        mkdir build_dir && cp config build_dir/.config
>        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cros=
s W=3D1 O=3Dbuild_dir ARCH=3Darc SHELL=3D/bin/bash
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>=20
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>=20
> ERROR: modpost: "__st_r13_to_r22" [lib/zstd/zstd_decompress.ko] undefined!
> ERROR: modpost: "__st_r13_to_r17" [lib/zstd/zstd_decompress.ko] undefined!
>>> ERROR: modpost: "__ld_r13_to_r21_ret" [lib/zstd/zstd_decompress.ko] und=
efined!
> ERROR: modpost: "__ld_r13_to_r19_ret" [lib/zstd/zstd_decompress.ko] undef=
ined!
> ERROR: modpost: "__ld_r13_to_r22_ret" [lib/zstd/zstd_decompress.ko] undef=
ined!
> ERROR: modpost: "__st_r13_to_r25" [lib/zstd/zstd_decompress.ko] undefined!
> ERROR: modpost: "__st_r13_to_r24" [lib/zstd/zstd_decompress.ko] undefined!
> ERROR: modpost: "__ld_r13_to_r17_ret" [lib/zstd/zstd_decompress.ko] undef=
ined!
>>> ERROR: modpost: "__st_r13_to_r21" [lib/zstd/zstd_decompress.ko] undefin=
ed!
> ERROR: modpost: "__st_r13_to_r19" [lib/zstd/zstd_decompress.ko] undefined!
> WARNING: modpost: suppressed 5 unresolved symbol warnings because there w=
ere too many)

I'm really not sure what these errors mean. It looks like they were already=
 present,
there are just a few more added. Does anyone have any idea if these are imp=
ortant?

Best,
Nick Terrell

> --=20
> 0-DAY CI Kernel Test Service
> https://01.org/lkp=20
> <config.txt>

