Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AA12C86D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 01:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768786609; cv=fail; b=UgYGUr8rrDu5uP1lX9wFH8n8/9YVoqJNC+3+T/IZrac9ln13o7ccozoPXJ+on7pzf/QAdSEzXffDQE3UtHpGHfOwBOqkrHFAUfSVOvuTyUgYUMQP56OBK1qAVPaCrKRdkp+iE0+7J5UrpLW1YPTCKzASS6HF0Upl1OVSirJcrwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768786609; c=relaxed/simple;
	bh=FF5lQPubBWQDNvj5cxVc8dKL3zP4Tg8KtUxCBZka8r8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t8PUJXW7wLaL/Dc0J4I44UwJhk5knfoi4EoqMcIHZy+FLu2R+tp7d0aiDHl+gYP5irk72lpBwrjEdZ+aMi6lYgizlRRhSsP2zLe+2r6uAuRmEZiR7xFrIwTks2JdEjDvoyGNJ3UWFBUR1MPP+R2F24y0zJwjqFmoK0VeImxRfz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ce5xpPPe; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hSKsZb5x; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ce5xpPPe";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hSKsZb5x"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60INbaMg4120208;
	Mon, 19 Jan 2026 01:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=DLjbo+P27erj6qjdqN
	KNra/2O1ELyHprw8dSKp2EVIc=; b=ce5xpPPef8UaVmig6aNLZfH5OSqol7IuBD
	h1Y65LyF9p2MBETUIvpKQHsYT9Va9jn8AU2db1vktZ3I8Gl6duMfHKWvnqAW/79I
	2scR1bZj/YMKIQF7EeVXw8nsgnAKLj33QUptoWWHIKfOiQW1mL4sYNhmeY/rnzc8
	lwqwAAYWRvJcERQ0LQpn8LKuJWMHawxlGfzmeskDjXnsaUBH6FssB3OPnCQzduuE
	6s+MA1TSnRoZHYNaj4XyezEIYttvPwESpuzKZRn+48uajOASDRRXhbg4oqe9sPvH
	9/NZK2+s22TDjsamoPKGylBZIntkUZrSfCnduybnBLPp0jR6vTYw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4br2ypsgp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jan 2026 01:36:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60IN9hF2008437;
	Mon, 19 Jan 2026 01:36:45 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012057.outbound.protection.outlook.com [40.107.200.57])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4br0v7skxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jan 2026 01:36:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aIL5HmaYJ9mlI9Gt7Gsjdb6BkIx9DlN+PXd7fMXP+/89M+Zq6BVwi9jNcKqHNRdkWjXAwEd83zKdHRCFgL7QfD7xNIi0DK8PsH1p4kGatDKEmpHlhMN3AeeUnRgNLmkRgWTa0t+0uBlidebimWS6XUDkpHYNHA6qkXpE0G6CDdU15zhXbeINdFGLubgkzWRMCOwNHh6rQ6YDwcFJmfR+BjayXYKLeepwAJAjDKkiLFjU+mY8iLsx1KQ3zONddPWJSGlSZzaPCG7LxBa6D216nIz7cGcwKSGUQrNNe4E1rLiiib/2aGX5RpkRscz2tyMSr7gdNdU2DxeJys5egwqMCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLjbo+P27erj6qjdqNKNra/2O1ELyHprw8dSKp2EVIc=;
 b=OzELoLRCoUmq5Ad7wDlu1RyQDSlg59llkie490jL1ROTaVAxvWfw6RXdlYcGDqwCLOr6TO2JAD/jTtlI4DlTENeTYFf8xriywINd/Bc4zcYuAHTsy3+ELCtx0Rpu1hJBrHPNJLj3UUub/5e/73DjYh0bloN+4VuYyRvotu1IViAB8jJJovn2IQbdHd3lBh3eTECsb14u2enYIFrd2wvuUzzKqtVZyN/0YYSPoLD2rMOtjACOhRwW0bkyRzXKCC3ly7O+AGZoZDnbgHScyPiU5r3AkbIDl4zTdXSfQAVHje63ioi91iUa+p1X433Kqd7SfxUi3ZlkxKa9SBYPFyuIPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLjbo+P27erj6qjdqNKNra/2O1ELyHprw8dSKp2EVIc=;
 b=hSKsZb5xt+mOD/ToaMpUMtA2KEy0r7dnI2omXCpp5ny+RZgJ3/ldJAzAuFdRJXbH3YqHPjf4XhOIc5+/m2oLovjbPsQqSxooopgPHdcfdZizVy6uW0YpLSThZKqDJ0l0gD1KQ0KKw6oQWXQ4LpsW2Qqu83lLK+VM6PyxQhvdE7I=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by PH0PR10MB5893.namprd10.prod.outlook.com (2603:10b6:510:149::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.8; Mon, 19 Jan
 2026 01:36:42 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%7]) with mapi id 15.20.9520.010; Mon, 19 Jan 2026
 01:36:42 +0000
Date: Mon, 19 Jan 2026 10:36:37 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [linux-next:master 5478/6849] mm/slub.c:2340:16: error: use of
 undeclared identifier 'MEMCG_DATA_OBJEXTS'
Message-ID: <aW2KpbqlxEbWhCey@hyeyoo>
References: <202601172108.4M7RmCaj-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601172108.4M7RmCaj-lkp@intel.com>
X-ClientProxiedBy: SE2P216CA0063.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:118::12) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|PH0PR10MB5893:EE_
X-MS-Office365-Filtering-Correlation-Id: e15d91b2-0403-4868-09e2-08de56fb3273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0c7aQmgMEi9+IsAJVQ+IoNTySRlLFDQ8tx4g1/8bYqYo9V9JjH5aXTKxE+bL?=
 =?us-ascii?Q?QZNi9+3mnAMA9lPhv1H+aT+N9LMs/L2XsrxbU9f7q1MsP7RhfHz4M94LSOaM?=
 =?us-ascii?Q?Eti49Tfbs2ZQOpHZ/b4fRaIqyl+CO35f3Aos+4SHZIPrNtuXBMaCw75fviD4?=
 =?us-ascii?Q?oos5CpSNummLY8kVzyI/+ScLk9DVvwP2DoiLpsKY6cBs8nDsSdnmy4luYYrr?=
 =?us-ascii?Q?lA8d5OAO8Uxo9SwZnPJRFRbW/NTqigoui331P1UFzAo4t+TjOhcQQYcw+VyV?=
 =?us-ascii?Q?cf/aoNuhySkEYd988/IeS8GqoWh4NGGPd0GHnrToRBTR69nRqEAATL5P4BGC?=
 =?us-ascii?Q?xPq+IMzLwQ7NNYjSzdjov5vg5DHjkJYyrVW4ehMyXMwQrbkSNJ5n4pJvYqMv?=
 =?us-ascii?Q?SYXTB3Lcm8NnI62whPJvsO+brh3XI2h67/cG+XdERc9nTpsdo2ya9chVtjaQ?=
 =?us-ascii?Q?PusOXFIdJZGfOv12XGx+kKUhEJIoXXiEpMcu7L787OkkCLfPvzWpS+Db/NqH?=
 =?us-ascii?Q?V9gQCv4cqvnlwwuRWWjlhkxRzLOsWuOC/U3A7lMCYKUKnsnEkgd6F63biryt?=
 =?us-ascii?Q?2s/eN0wK9dSN6TmJ3HFKdDrOftNVUF83B1RBD7WDM5uScUCaGHJQv2ckzrNo?=
 =?us-ascii?Q?UrPe+Kt8jIiubjFfYOo5oNCtNGOfwpHa0PVzfUrTu1clWIIDLHDToW8G0Iv1?=
 =?us-ascii?Q?q9lN4WfaqxC+q45CmppwKE8AB0jI9L4z3NiGmLZB5MKKCpVjyE75UuVHAva4?=
 =?us-ascii?Q?XOrYV6YQJL7WFLZ8raqXIBtxF+LdUfbfLy05h4Tg6r4xzXI8f+AkIHU2cKkB?=
 =?us-ascii?Q?T6ctEMpCtyiONHLD0kHxmIyA40OtmtlqyMAAewbxhuooPX7pMSj6f/hMhkR4?=
 =?us-ascii?Q?ZZjOPpBdjjK8q5h/D/ZS5QTrhuQe6bT179VpWrthM5C60umBhPmPjm1c61ot?=
 =?us-ascii?Q?e2Fzam0uvlNgk5L7eBwTPmL/znPjoxShiFes9zcjU9BrPPJZJooAZQ//ZMo9?=
 =?us-ascii?Q?jVg4HrklkvVCLuTKA4Adl8T+Ln/Od0ue71jHTIf81J21S+P8omI4OcH+/I4z?=
 =?us-ascii?Q?oiyZ/hAbxyOKO4AnczJxwQmz67Ojeo2BoHO2XSdXYgU/RENUPyomcuy+M7ck?=
 =?us-ascii?Q?Gt1+IZ4WwTDxCyd0/BU+cJK8g1bN6nC19hz6EKO3s5RdJ05eDysaXNkBT1EW?=
 =?us-ascii?Q?LVNNEL7w2e5yVsOVI0Xk7POmuMaHL3m7xragv7Sa3YVEK4VfKIQEY8wq2G0l?=
 =?us-ascii?Q?JzJPXlWDPBJ/1O85rEL3iCTcoYOvhLt0GyH6DY3seawYzgqgMWwLPH4ZUZ7h?=
 =?us-ascii?Q?qV7Iz5RIVcWL08Ge0eBMLvaiKE472WI2T3vewrSbTH18eLzLcQoXyYevn4TJ?=
 =?us-ascii?Q?gK/r3/dcZKiW0Prw2BN/VjmZGNNYxoics7Q6JFHAyG0IIr0WmPcPpfej7owU?=
 =?us-ascii?Q?L72gEBWxnXxlSuVIRE59WZ1kAUzJ2TipJ6sh82UKuv0F67BfleclxQD2FIHg?=
 =?us-ascii?Q?MGo5p719YVZe0QOVboD8CXLd3dLY8sFShhfqrYAU4F6BrkWHdhuufA4lbdQi?=
 =?us-ascii?Q?bXw8iupBa0pcANBWFwXhQnMas6sQZpHSLnUuVJH8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DtZyfkp+f/lVs1RX897UV5SwFyOXatgpi+YZU5GuQfEcYG7Bweh3tkSBeWqA?=
 =?us-ascii?Q?tW1GpP/Sw6T5+gUXoFj93RfTE7pso3r99QydQWI5DzF1FIf3SY0XC3iNNLpV?=
 =?us-ascii?Q?GRP2CzoR69onenUjDuUZSMX5kKyznoMf/e7nSzRYQZ3ohz44olJGlrzTLw3J?=
 =?us-ascii?Q?G6Lpt1j0ZQ5sAnioc+OnYcEi2Oj+J3/qT2H3UM021nw4XCwoxmAtk3jlAdvF?=
 =?us-ascii?Q?d7ZEe3uKH5Xb8vm8QGQbzhXUFb6fcVySbOPB39E+WOK8qHDs+XwA+lUmbW6O?=
 =?us-ascii?Q?c1v+MkIqrvez4se5LIInnkk54H4dBb/Ukd/La1te4QnsPtgC/pIC007B2qGz?=
 =?us-ascii?Q?gP26V86yk45Hzn13zeAm+U8vAZePUjL/7qr7XZ+qeiMrkYnpDE/yGJjZOnSK?=
 =?us-ascii?Q?WO/BnJqlIp3B57VG9+cDk6gnhzMgoB7E5F/20NbSTf+yOOU/nYqk4Pgdif9P?=
 =?us-ascii?Q?G7kP9YeqXB1Pvjljmvb6mEgXbXNPvwM2GgeWl53o23ZfzVhf5jT1I7d/esbJ?=
 =?us-ascii?Q?cTHtcGXSajzmQGPr29CGWD7+kovDK0vjvAgm6TteacGlXlLfJk/uEy0h7z/2?=
 =?us-ascii?Q?zUahjy/N6mELcjAbUu8WqskHMP0WEqw9mfSsF/K/NdZu2KPxfIITQZd1Q+g5?=
 =?us-ascii?Q?GAwG7jHq6BTZq8/KGllcVNToUclIm1Y41XJa2ocdjqTRLPgu8TYrSSVTrz9U?=
 =?us-ascii?Q?abp4rzBNmG4rYAcxu0IXjcQY6fuSQgjtR9UhSolC8dC9MdC1WgeyQQe6i701?=
 =?us-ascii?Q?YQQojXrpat8Y0yZihI/C2p7inj3P73FfW8rOmdIKRoFmT//MOo3DgsntN7pR?=
 =?us-ascii?Q?fHy+OR4UGTH9/UFf7Z7xVJL3+pQVJkbyeskpObaOJOXOYzO2t3UOYuSLRPQ2?=
 =?us-ascii?Q?Djy6R3OXmNVyzgCZmg6CphB6JHeX05wGnAOQbGgiuG5lVP/mVUhBZILvofEY?=
 =?us-ascii?Q?p8Yac3KA+AYbAv4cGi6R+Ex94DMF0rGY58LL8MB5P9kaQxXtraNhKpXlgaG+?=
 =?us-ascii?Q?1sY3S1qt5FIhekOZBoH/XIG00eDp+cA6OGXkL7EZPJR8cKNH4QrOC6P752ov?=
 =?us-ascii?Q?AvZsPpkmlnKeAW8u46/iQ8LeCJAJmb/ptG9Juo3agixcrkbbusxmiLvg9dra?=
 =?us-ascii?Q?taY+9hIpjtEBv5DHt6J17DPiW6qa0pzMcgoKLxOJOYXIV326gtxbmcJsP+xs?=
 =?us-ascii?Q?ahQwft9dGIJ6UhCzzqT2F0NP8dkzqHGlV82VEtFKDf5hP/wsCCpfuDsZPs3B?=
 =?us-ascii?Q?XO/yQR177Xxk+7fjsuYhYSRr97WKCRxEIIy9/S81nd95+cmW7uX/7eqq40IB?=
 =?us-ascii?Q?FEd6tsPyY8HcFzdkKIJWTNlqs678tLrPZdBBdc5s0LdY20F87K+b5EM1wQyl?=
 =?us-ascii?Q?vA/qOp1JzKOw31j9WJ/D73pO6OyTltSgrHovhjlPvYDRVb8yv3JF3GOMdavH?=
 =?us-ascii?Q?gJMDmM8VXxaDs3kdn5m78usz5jsHDTrUl+rfsCYHGmh8amAPYDUEVYkInl3R?=
 =?us-ascii?Q?rIlkgI4oa9lVLRTIFKhQru2q/NKw8pUfSIlbDxqCh9+VdTbns5+mp01wbZd0?=
 =?us-ascii?Q?e3W1SPkjU5sOSf4JfweQSaUwVvzTQXS6iYUD+XJ2qsR1XENhI8iHabUEQfW4?=
 =?us-ascii?Q?lS05ZL467vlekuANXD9/DCnOGXOYME/CYSLtcAZaFhUE3XwLPRPWDoHlWOp9?=
 =?us-ascii?Q?x+8vRQ1ZGoldRqpF0ZRUv40mbrsDlYTggcQoYVHfny6iTMepJSfpUbgbovF8?=
 =?us-ascii?Q?IUSq7nArdQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HWo96tA2q6tGJOkjVP9m/NI95dMPCr/uS6d2UzYNw0Xk4Xpu+Kk1VCa+FddAcS3tOphXnnfK/bGg1/9XhB9jlS8V7XMabmmW25BaDDaxvTg5PBW7lEEwHYYSdSiklUyXVsysi8s58/IK786JqkuF4GMbEW9vh59giglv7177j9Cl4I0kBj1wTtTh3Dnp636QOK+gKTU2MyxlBF4JxSKC3T8lHMzV3BXZKexSu70QT73hQOcnPmxl1/zJaeal7Yc9QYeHEK+LhYcjMFExaD/zT552dWHtjIH/gW6kHgdV3T7awWVw/cPwByIxS/UAknzWuY/OMP9Ti4rYMv3p/duuGRpONwXqLCIhighgAcfxL+hd7J5oWzhejvDmaOMOk+DG+I3ja+aYLKHeUebqV+kg59xD43N4cXEEplrWo+SZjbnBW1TBPwn9opiKYgnELrvOtXtCxy8RwX//UU65gn68I0SutWyphuis7/mnYV5QXojL8X31Yuz8STXPQuBlKYDVfffMYYN9U6uyvobeh0y06u1qVM1T3ObTWrIzlfMGSJsGG0Uyvezb3ylilCbueycAah1OPnZtQSGp1FLbNIrh+pt6PLvLt94gUiw9iYYbv6g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e15d91b2-0403-4868-09e2-08de56fb3273
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 01:36:41.9869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6cL5zY1n6uHxvLntTLh4j3jm1ge5+GAiDoWXIrplU2nauqF3/7Pfla2Y/OeKur5ll50URRi5G7liODmJKPAgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5893
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601190011
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDAxMiBTYWx0ZWRfX6947zu/ptnIr
 QuOHtCNuMj4/Q8+s4sRqyOHC4Nwr52WrHXRdw6ubt7Tn9+KFgRAFSj1lA3eb/6LBt+y5exTyBl8
 rLfjYQlxHUquwZ4IaVqU3LEVW820NLfUPUtVUAi6gm4jA/DOt0Etz8rjH3bEMiYwTVzxFcb5PzV
 9LUgdm/Nnq3vYTnMyGt6+vvnsWPDD5lSr7My496uyYr1XEu6o6kYhNlo+p/E9DQNjYqv88OdJP3
 Fs2BD04axic9M1mNtcopTu6v9pJ88KOYBMv99iu3fLXWUhH6hAbINQ3mM8WFUuDciMjUosyOoKG
 NQ1aSES1lTZL2WFcvTK8pnezVZV5fn0/vUbB2dWQqV2NLigZ0waZBlYW3vOReiV49UDi0qsvgru
 jM7hJN0B73iXPZw15WFGqVFHi0jYWn+BsYGHidz87FdhVirNt+ZCNve6jpV6Tkk5nITXKJ7NsTp
 AeF+hmv3PjXKIGkjkgg==
X-Authority-Analysis: v=2.4 cv=de6NHHXe c=1 sm=1 tr=0 ts=696d8aad cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=NEAV23lmAAAA:8
 a=kO5AkwbwI52RYLD-VeAA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=CjuIK1q_8ugA:10
 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-ORIG-GUID: hAnVsEYSzvNj1yRWB-faVHSdv-U6lN34
X-Proofpoint-GUID: hAnVsEYSzvNj1yRWB-faVHSdv-U6lN34

On Sat, Jan 17, 2026 at 09:23:02PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> head:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
> commit: aeb88c8de3688638632d5867c352676d334e6531 [5478/6849] mm/slab: save memory by allocating slabobj_ext array from leftover
> config: mips-randconfig-r062-20260117 (https://download.01.org/0day-ci/archive/20260117/202601172108.4M7RmCaj-lkp@intel.com/config
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601172108.4M7RmCaj-lkp@intel.com/reproduce
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601172108.4M7RmCaj-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    mm/slub.c:2154:33: error: passing 'union codetag_ref' to parameter of incompatible type 'union codetag_ref *'; take the address with &
>     2154 |                 if (unlikely(is_codetag_empty(ext->ref))) {
>          |                                               ^~~~~~~~
>          |                                               &

Oh, what a silly mistake. This should definitely be &ext->ref.
How it didn't break my build with CONFIG_MEM_ALLOC_PROFILING=y?

>    include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
>       77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
>          |                                             ^
>    include/linux/alloc_tag.h:52:56: note: passing argument to parameter 'ref' here
>       52 | static inline bool is_codetag_empty(union codetag_ref *ref)
>          |                                                        ^
> >> mm/slub.c:2340:16: error: use of undeclared identifier 'MEMCG_DATA_OBJEXTS'
>     2340 |                         obj_exts |= MEMCG_DATA_OBJEXTS;
>          |                                     ^
>    2 errors generated.
> 
> 
> vim +/MEMCG_DATA_OBJEXTS +2340 mm/slub.c
> 
>   2316	
>   2317	/*
>   2318	 * Try to allocate slabobj_ext array from unused space.
>   2319	 * This function must be called on a freshly allocated slab to prevent
>   2320	 * concurrency problems.
>   2321	 */
>   2322	static void alloc_slab_obj_exts_early(struct kmem_cache *s, struct slab *slab)
>   2323	{
>   2324		void *addr;
>   2325		unsigned long obj_exts;
>   2326	
>   2327		if (!need_slab_obj_exts(s))
>   2328			return;
>   2329	
>   2330		if (obj_exts_fit_within_slab_leftover(s, slab)) {
>   2331			addr = slab_address(slab) + obj_exts_offset_in_slab(s, slab);
>   2332			addr = kasan_reset_tag(addr);
>   2333			obj_exts = (unsigned long)addr;
>   2334	
>   2335			get_slab_obj_exts(obj_exts);
>   2336			memset(addr, 0, obj_exts_size_in_slab(slab));
>   2337			put_slab_obj_exts(obj_exts);
>   2338	
>   2339			if (IS_ENABLED(CONFIG_MEMCG))
> > 2340				obj_exts |= MEMCG_DATA_OBJEXTS;

The config does not enable CONFIG_MEMCG.

Hmm, this is strange. It works when I change it to #ifdef CONFIG_MEMCG,
but doesn't work with IS_ENABLED().

>   2341			slab->obj_exts = obj_exts;
>   2342			slab_set_stride(slab, sizeof(struct slabobj_ext));
>   2343		}
>   2344	}
>   2345	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

-- 
Cheers,
Harry / Hyeonggon
