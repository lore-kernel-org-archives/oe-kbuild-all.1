Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B3E1E98F4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Feb 2025 13:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738934576; cv=fail; b=WgDJlR+eP5Zci1EXAQgRf9wwgBwsbTyeG6zMpSEH/JQ5KiDDJFGUETKaYGm7Gr/7Ge2/QC/seJVZd2YKxBeHZX8hIu2KOD4LXSXQVaOZTsKBM9omWhnTsjbOfflIylpIVVo81k6GwDh0/sOIk8jDhRTAQCkHjXJoz8XCQJg+1A4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738934576; c=relaxed/simple;
	bh=czvouNU7EwQXAzv7VGqMcu2ZyJAUtIb3t07WMwWvIXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tXon+v90KsGcMinJkl4MDxn1wLQv6XP8ojkB7HrSQ5c+z+5iVsnzkymKK64Mk/3pkRplpz46kcTbyIAvKWcVcDqbFV2VvXMsimleV6i+Sc02iaegPLNhQCEJVnLC1Lun6F324dNGZWdI7/HFhUvMy6vAcZYPtXDK/faG6WYx0kk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BB93lGyF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oYSz3Zkr; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BB93lGyF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oYSz3Zkr"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5171twvH014683;
	Fri, 7 Feb 2025 13:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=6fqLd7UQbF69Hdy3pQ
	9v2n8Op1TQXYJCTb0cEQafqAs=; b=BB93lGyFv/5v5QJg6tqgg29OuuEa0rpVXP
	JeTQCjw2so/ANoMcqy7TIg57SrYZjpMbpRtXHdIihsP2gk6LYmqpjnhhWGcpr19w
	Qq+UFgyw8jt+Fha0i7HsNnWduq+XKAaXI6hHaIvlBgAHtFecRJ3Gn64erXJ/roby
	O5B1bnX9CZQnTjQ42BYlisRIw/rtCHPvW8w2aLx1xMpIAYmcQaaunVuW7c8QHhZr
	jC0Qiwm0GCps8+5XBReI5sc7XDch3yPgMJulQPlYTYax+Kv0Nc6M0w7if/1GpZdf
	MuYEH9g4Wz0gCQO5VmMEhxVojpx7sflz2BdpvtYs6+DvoCaBsuYA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44m58cmquh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 07 Feb 2025 13:22:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 517BPeC5027810;
	Fri, 7 Feb 2025 13:22:45 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44j8p782vg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 07 Feb 2025 13:22:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4tx6yPqslB0zAbQ1z7wMETJsm0bMdDm6/pNt2xtBku+i+ejPeX/qNJygFxkg9pZ+b8ZM1spAVNcqR1bzDw9VkIDRPoYdxSRGxbtbWrmJmPio5pmbeN58SzVv7Z9XOmxCYsNmQE/4z9MOs74L6i4GfI8g1h1Kzt8CHVxf1NWphyqVrjsIJEB6IIp2QBJc8Nue55xv2dWS7UMQAHZRw2JUHRQoSb3LejQ2RaNyNSUURNqcIWl2Zdpp20bvHBrSxLB0hwvXEvkUvVVR6QQ8lZ3L9xIDDLGj3wIiFPS4i46LfKfnAUXMIfI2sT5I8ssUBDcZNq2QouEyCY803msN5ee0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6fqLd7UQbF69Hdy3pQ9v2n8Op1TQXYJCTb0cEQafqAs=;
 b=zS4X3B2+zfA6dvMSTYmlDwuos00hEjQeQPajzPUt7c5YxivTbDcyzfhWf+myr9w6spOfbAW1OYKIaFL1UEHn8yKLXKPXU4mvKq6cTzmdPjW+wJw/AgKsJhJbG+/dgipEav6Gd1dS9PL8VMxryoAuFEtBaqamjzVCAmHdZrVOj/rUj9tiZBYXPjDgPuEDfF/IkfYQ4+TcU+rVYGezBbFPHFSFamdSvSp04bpC/8C1hm0k8nStOWiq+FiqLvB8g3UCpQzeWjq4D5ral/MnAkUmZsj3NZeJSu4I05bPgJw4pcBOAIwDrLVWg+WVnaKFPWtw+RtBaOflwOVGY06Klgkciw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fqLd7UQbF69Hdy3pQ9v2n8Op1TQXYJCTb0cEQafqAs=;
 b=oYSz3ZkrT34GNdB8aL0YrnucrUqLTpdyd567cq3Hu0NCg/vK+MLCPU3hdTnRhxQdb4KbSehb0FvUNIkpb4d6hLyIPBGmQFxaU0zwGDXLYJOKeg8RWUtWhNbbSXrUmtugz9wyBhqsbhMJhL+zIV+LBmoSmAZ8uKeWNWSahQhSRaY=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by CH0PR10MB7534.namprd10.prod.outlook.com (2603:10b6:610:190::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 13:22:43 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Fri, 7 Feb 2025
 13:22:43 +0000
Date: Fri, 7 Feb 2025 13:22:41 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        oe-kbuild-all@lists.linux.dev,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 1418/1780] kismet: WARNING: unmet direct
 dependencies detected for FB_DEFERRED_IO when selected by
 FB_SYSMEM_HELPERS_DEFERRED
Message-ID: <a483e2d0-f221-4d6d-86c7-f0e4d9adf4d6@lucifer.local>
References: <202502070529.LDjeJquO-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202502070529.LDjeJquO-lkp@intel.com>
X-ClientProxiedBy: LO4P123CA0537.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::17) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|CH0PR10MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: 92fa89b8-13a3-4b2b-fa0a-08dd477a8121
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qEkKVECsadFpkFfqI+nTj8PKizkJ7dPhuWE1zHfkcpfXMDLZooX6JVuMpp2X?=
 =?us-ascii?Q?hBcscEB2TqU/n9KKVUTwPD+tXqt3jgDphl5kl/1MxEsb5YHT2whhPW62npVq?=
 =?us-ascii?Q?+thKENNGMVUmbKxI8qS+coXmkLaLfNbfkegUzTdGZVubkmooROlKE7dardiw?=
 =?us-ascii?Q?C/19om3D541wpd9X+Ho8TEAApD0KxZNN4/cQvrsuzmgjZq0pqOvacniNdMSt?=
 =?us-ascii?Q?Ie6NnefPhBAGcnLOje8fYBmdOVgnHUeYfo1Zr4wZrLQORX6otoxEXLARySKB?=
 =?us-ascii?Q?1WtaWCiha1BpzqNyxG+MWUTCypB3vFLI2OFgJBFRvQy8g4d86hfjllpj8xVb?=
 =?us-ascii?Q?gkIWRmNyQlCJQJUrtGtqpIJua3iDZR2lnHGJx90iX9iSGM1TkZ+wLHQ0jXNQ?=
 =?us-ascii?Q?6aip1F0eSGtlWKYGb8kDBV+p+B3oCI/HVCOXx0w1jVDzh35ie6UfhUJ7U1F0?=
 =?us-ascii?Q?A0BPs8qhDrxPxrBRmEvVxesiv/ih/Pt59GYkTJ5Hx9gVoookgziSGsbQ+KVd?=
 =?us-ascii?Q?hVUUzEmb5D1vVEADWMWMlktPmTSTWcrs4yM5J9MpFejLiQW5EBPjbTaFe3TL?=
 =?us-ascii?Q?GanCHqQ/udwBtitDpWe96s9rvrhA4k29/xtWlThHd6PdXnjSl9E6I+jRmJvK?=
 =?us-ascii?Q?WE5ayXfLGrr6qOJWkgO2AViU2gNIu6FuwalIywsZQ/uqO/3+9lboJ2ODT0Wv?=
 =?us-ascii?Q?zZ7rAkHLNtKkApoyAyoLI4/jKSJQV0UBT5M+7/n4kiOJEbXg/cZ/AhPCcCjE?=
 =?us-ascii?Q?pw8snUha2dTXCbpi7yN0rC3Ym7ZEhbmju1WEdCbG71f/rkJtOZA4df2tAKRp?=
 =?us-ascii?Q?Yc5ER6g9hmBk/AFIQJiNl8ejLHgViT1Kn/QQTJRD2HMc1rc65ysAfD39XyNp?=
 =?us-ascii?Q?CnG9V9MbJUQd+aga+y9RuKkT3EDc2wb5mDbN8C58dD1Ab3a2eApn0iD3shco?=
 =?us-ascii?Q?nTH7UMaz1i/MJXh7iIds/X9Ly60SQhMd5mBRcQeynrRlFOx5PK3Tfn6BH7Kj?=
 =?us-ascii?Q?PA8ECGxn9PKpAk026/3gW3jGIoB20piIqBuIlqfWKVAMsWkD1ZgXpBZQ4nU5?=
 =?us-ascii?Q?miaThT5jl0IyW6ri7AvwPX7/alVaSHceSNCLc+KpgXYh6anT16CPFf46pY8j?=
 =?us-ascii?Q?H0EVh1sgcJVnBSAJLa0i7ZIRDe7sjU2wFiF6cuiAmt6yPVwnDP9nf0Nwpko1?=
 =?us-ascii?Q?h8pmEy+UZUR5LzyTxthO5hg2nSWvuaVDErglI1exPxA2gBhs+J9vWBiwwIjw?=
 =?us-ascii?Q?2G/uHWa0psm7z1IF13wfq0JWtAIphmp0X/iugfPa9McbJnRcU/n4Cx+riGgt?=
 =?us-ascii?Q?PibpcDeZqVq8KgHUNFVFkXynieYjOlmWD0JXbDsbgWUCew=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dv98dvh2r7dG0bkecpoKrKPjnOrCvy1LcobUd2xN2naH3f4CbKhIJup+p4Ew?=
 =?us-ascii?Q?48lzhrroHLgZvp6fMvnfC7Xw6R7yk9rJ9bA4D+q25ETdLpRWrhR0NCKasqLW?=
 =?us-ascii?Q?RE6Ovdyf/GYho6bqrWcmQx+V9D+rkMRck85E2EDom5ESo1w90CZ3E+YlHA6O?=
 =?us-ascii?Q?E8fPRnR5gYhz+vbXKvH8cyhL00/o0C7nUAub8hQOeL8YJJa5B8EuqtXPUDh/?=
 =?us-ascii?Q?qVIMP9JiABcxfeNacmVcWowR20vBZEiqYqmYMk6Jvgabq3SnUN3ggp3W1rsR?=
 =?us-ascii?Q?biLWHDP5oPb8YK3yNHfgB4sWL+cvTrAze6ItNe6k3NjK8f1t6wcZwWFUC+sF?=
 =?us-ascii?Q?RSlzDhanOa2zTR1F+5pRwAfNIeGIyAP1dO0rcUfSBigaRGCDttCbJ4BhZXDz?=
 =?us-ascii?Q?ofHPGzUL2IXHnTIUHvz/bRxzhPIkZyNJ0SX+9/ky8U/OliCJ0jkFxeAQF/XL?=
 =?us-ascii?Q?3e/bTVzdYNWcPCW3U4+LzzbcWe4u5ZCwR5TaroUAw+9jh1Bg+dwyl9CXK7Ik?=
 =?us-ascii?Q?BABAzzQhBTjqS/HS5kW/bcw6n7k35kM4E0F9rMqyzQgR10ofM3jxSQ2GGL7s?=
 =?us-ascii?Q?ho7Wksl9BMVP4HkvXJbJc3WX2fVHCM/eEz4cqtjZ69+N69ZMOuZJP6AB6m5U?=
 =?us-ascii?Q?ScWgghvz+VYqGvRdfQjROZbHIFi0oKheBE49VrjQpCqY7KIC7Hr5y1pNWNMH?=
 =?us-ascii?Q?rBvW1gimre24/ImvxohicPD7+5gz0isG55hJFeXwVFsl5k1SAlw0Xvp0HOo2?=
 =?us-ascii?Q?xriOETGyK/DFEVOMzkV/yJtefD77M3ziGt9qpmpIywz6GnycBoOee07kdUjE?=
 =?us-ascii?Q?Jqaq3e/2WGys/A98UDxhb6BnCHUSXCLYPbrocKzFLRl0QbyTebGM3mz6jW7F?=
 =?us-ascii?Q?RJMPwvdVMN2DbNBMDQqxEuMYSM/9wkpW9cG8ZvUUnCnTT/3hr2qyF3VN5g87?=
 =?us-ascii?Q?iPC4+yqt4vvC+k0hGbEWDUBk8VOw6yOXZ5KLV0ck0qjW1ByqsFslaWvjPPrZ?=
 =?us-ascii?Q?B5O2q5bcXnwx8SrkKErV3Ne5X2mVszZ3Ge5QmmT6OVduV+2WjcoezL5zx22e?=
 =?us-ascii?Q?SlHvidiq2ORTkn60qfkLsFMLRxACpYxNSlVCnPc7qMKY0hMiMgJ+pPIZ0dq9?=
 =?us-ascii?Q?N3Xx2DCzkIwu25p7fuY+ZB/Zk9Ca67I0dhodIGtAavQfRlWIkbmNH52j9o2o?=
 =?us-ascii?Q?N5iPBzKFmIRcYemhS7FlhKkBdmjK7r3NIz/cBP5hQMpoj/5TpLiVvenl14WJ?=
 =?us-ascii?Q?yxSG3AEx5cdq6uvzqaoiv5qoFTvud39zwcwEu8CZUO8syt7HEZ0/NTzm/z8r?=
 =?us-ascii?Q?HIi0wFxlC6+ANaHR4Vt4METqtbqXzaLGuD9iNitDatRA5R1Go2isU/VojibM?=
 =?us-ascii?Q?2XoFW5Josoc7s5V0U8h0UkShvPd0IsgmnG/CW1fg3p1YDdw+TsvpBSEplWDG?=
 =?us-ascii?Q?/Bh5OdfPGtSI8FbfnpY/WMWgMxKpiZiJ8Pe+2+b77/1moLgQs7kYxMTqfNhu?=
 =?us-ascii?Q?O/Ez0GM3JxRyFzizocI71aWSTnGbrdEZcK6WgUBTURMLYkE5p2/n8oBLEI/w?=
 =?us-ascii?Q?DpxETOUjrzgx0iDWDyMIIKitdPyz9TLGNpWfHUtnhMvTYK+NijThzdgw18OT?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qxrUop//F0R+e/sA64vRNWJ5roMtVhPzjJoUHHG3Wd+ykvb77/TJ9g1NHxeHRSmkwDEleguQgDhS6bVvmCuWGL7HX53RWiP+BvFQyKT5++mgNre0R/caF7++oMGhtjrDJlg4K+dBu0aUWgliqKk1GCqqbXnXvCM/tNWbi3vRD6eeF0MPzAFifTMkW2pBZFbOnTrHsE2fc5qkxIMb4ysAuoaLCf9+RH0ry5loCjyG1JB5y9w7f6IQIqZHeWKztLTbYWkWYyLTnQDum10U3Rv0oICV0vHckOCZM1R8Xz6zYAfrkX+S1y0TK6/iXnaMSPzRwuetFeXT30ajC939xSXsY8QPIbiv4G7MViprGXOoq6zJfaxywJMH53/SiUxIVIUC82ATrxGAaqMfZ/4fN/8gGu40v8RbftUWCIQrIWii2/n6EapPj59ySW26GiCkKAY8aZwn+Cy/v+wqWvNNdAnZA8rHXv+zaHymKlqVjd534L9MzCotg4dj8ZBDAGf3lJvAci7k6LzB4lCwl7FXl+Zqi/5wFIxg28+aTl73wryd7QeVBXxYkFtam+NkgPXFlKpygCLlN8JVytKOb7R3kUHYrCfNsJJOe5sNcf1MZunLpW8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92fa89b8-13a3-4b2b-fa0a-08dd477a8121
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 13:22:43.6536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DxrAh1nMqrhfZkRAaEL/GaS1XsQl4YCvxrM7uPr61O4CNdlxKM0kq4H0Wa7zwsENubGehkV/hV1mwCZRkp+so7V6S6OHRMxrn2rXmqeivO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7534
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_06,2025-02-07_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502070102
X-Proofpoint-ORIG-GUID: tseedgNwvahIakJNrV-3P_QJ1Je4hyzy
X-Proofpoint-GUID: tseedgNwvahIakJNrV-3P_QJ1Je4hyzy

On Fri, Feb 07, 2025 at 05:40:56AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   808eb958781e4ebb6e9c0962af2e856767e20f45
> commit: 236ee083f1b9128fd5bd266054c5b8868f803cee [1418/1780] fbdev: have CONFIG_FB_DEFERRED_IO depend on CONFIG_MMU
> config: arm-kismet-CONFIG_FB_DEFERRED_IO-CONFIG_FB_SYSMEM_HELPERS_DEFERRED-0-0 (https://download.01.org/0day-ci/archive/20250207/202502070529.LDjeJquO-lkp@intel.com/config)
> reproduce: (https://download.01.org/0day-ci/archive/20250207/202502070529.LDjeJquO-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502070529.LDjeJquO-lkp@intel.com/
>
> kismet warnings: (new ones prefixed by >>)
> >> kismet: WARNING: unmet direct dependencies detected for FB_DEFERRED_IO when selected by FB_SYSMEM_HELPERS_DEFERRED
>    WARNING: unmet direct dependencies detected for FB_DEFERRED_IO
>      Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=y] && MMU [=n]
>      Selected by [y]:
>      - FB_SYSMEM_HELPERS_DEFERRED [=y] && HAS_IOMEM [=y] && FB_CORE [=y]
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

I wonder if there's a way to aggregate duplicate reports like this? I understand
that might be challenging to do correctly though... :)

I responded to this in [0], so won't duplicate here.

[0]:https://lore.kernel.org/linux-mm/6142d666-5245-4e00-8b1f-c43c6e98638f@lucifer.local/
