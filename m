Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67AE33120E;
	Thu, 14 May 2026 17:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778780261; cv=fail; b=s7tnapVIfsB5wPQNAQtL5ieR8qKWM/rcu+zVjTBNpkp4fSRTVY0PpLHeLm3m7YTe6nU7gy/nYx2woaq+FflKtblsGxXHtoMgdZbp3bJh5Pdm23+b2OBk/QKYy/4mZs2D2hOQrc5B2K6YTjV6hc4907ylo7CSMj/U4c4g6jehOWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778780261; c=relaxed/simple;
	bh=R7LuNnV/0cZu5k2VYmgj8j4azvKr6qGsXsFO6c4Fq/E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cSARx9MRfsbZWKdFtf+/wK1NJ/k/5IUPl1A/nKUJFROdW13WfgUwLYTAd+EYoi55TBbGCrlFlut+KPs9A+V7ER4VDPgTxSmA68KMzkoloAWuoc12vYY24zsCmXGKPbjg0O7WlsCLAMm+ZUJoyjvYc27awbtpR8IYXyigMKItUF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FXVmZyZH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jUwE7ano; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FXVmZyZH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jUwE7ano"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EAMbFA1922328;
	Thu, 14 May 2026 17:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=gT/kJtDPUIku4qtq4vNohxK/ImiJmHl2weeEojp56Ok=; b=
	FXVmZyZHjP9WPFzGq9iVfP2w4cwNEdJdO3GXnLqaepPEjWFhs0Ir4zjjRw5xmrwj
	eKQM/23RZal+inF/64c1LXiHi+xJd55Bt6bAulJonhVYSRfkVOJ/RI2ifHjhZxkW
	xRvakBWh1poF+gL6Xak3s5nIftKkXIKgjo309JFnCkkzCmoj9nIPiBDe7qVj3o/P
	t9OlLcyRX+H6ZvkajLpD8HQ5uuyq7ke+jtMQ0d7zXI2/QRn12CySC/tMJ9dEUIYD
	SCPozsNI2g8i9/TwyOTXC7XRP/TM57uKkEZqfFeW8NexjZRdhyEqvG/040I0lt0s
	uWeVXyYwms4DIVWgiL0rYQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4e4c97uppk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 May 2026 17:37:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 64EHZ6mj035921;
	Thu, 14 May 2026 17:37:32 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012020.outbound.protection.outlook.com [52.101.53.20])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4e3necq6xw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 May 2026 17:37:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E6x2EuDHxJYJSlEiOcSbl2SaV1QIAFe9owOY0WbxAWHCZ2JkBASHuuU1O0YAidkdYoWWCgtfQAXGUMugtm5z4zAx85NUSJ8dgXT+G/W5zU3fSKqYeN5zmpf6DvafTWZyh9WsycYA5sC7o6MVwpZTV4HlEAcqAIxzWHBIduMLHK3B8JqecU5byMkEyKM/AI5Qzw69SzAeRk3Az7Nlg1r857kOmQI0zUjoIJiKwLsg1UBilMqSfQA6kLQ+f2OX6C92GSJJjTsvP1Mgof0EPmMnGph8HPLKChjGSW5JHliLQJ4qn2Jfsw4LZpzJWGGGmy7MbnIbt3kFpSw3mc/cgRfEwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gT/kJtDPUIku4qtq4vNohxK/ImiJmHl2weeEojp56Ok=;
 b=X/R9zv6sH7bp0DOziMENAhKXeYaaKQ21yLhZpNs95+uayrHYx7VAPRgz+ixU6QAGFF/Msj1nJVEKx8x+8uFHyS791WdzRUeHX0mnThb6dhr6iJTn/hmXtnZYZNG1KxMkbj40QG9C3ar7zGI8BECtTd/HV2y0fK/HZ1ADNbPV8FDa6N894R1TNVBMU8hOF54bNyr+ypj7Yy0C8hLb4b6zxhuVW/4MBZdAEpwNbJCVBSWAtt2LQbS2Jfm4nHCUD/Ctx0ubgzKtDmbqzOl+Z/fLpRaAOQBG42sqhSvEzaJqTDKEpTxL7HDWYrXHCM8d2nt5ElMAaRuW5NfjAz4Iuv0vzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gT/kJtDPUIku4qtq4vNohxK/ImiJmHl2weeEojp56Ok=;
 b=jUwE7ano8UmvA4LkjvVFFsF1HENLPFsjAAUtHWPUoDCoEpx0d6quii54tvnC2Yu6Fyp6DOualh5aY+ZHavMXsJ+B3lTPouF3IS4oJR/Q1osaLsY4f42FbPohzj/b4XEcNlfMp9cUiktmhFyji9aBgYwh1/E46+lanPdDlvruu2Y=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by PH7PR10MB7034.namprd10.prod.outlook.com (2603:10b6:510:278::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 17:37:27 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::4083:91ab:47a4:f244]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::4083:91ab:47a4:f244%3]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 17:37:25 +0000
Message-ID: <c295b65f-bbf8-442e-8cdd-b1c5159eefd9@oracle.com>
Date: Thu, 14 May 2026 13:37:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: fs/nfs/nfs4super.c:232:17: sparse: sparse: incompatible types in
 conditional expression (different base types):
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
        Jeff Layton <jlayton@kernel.org>, kernel test robot <lkp@intel.com>
References: <202605141218.uA0wk544-lkp@intel.com>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <202605141218.uA0wk544-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5PR02CA0001.namprd02.prod.outlook.com
 (2603:10b6:610:1ed::17) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|PH7PR10MB7034:EE_
X-MS-Office365-Filtering-Correlation-Id: 11986f2d-675f-4cab-4cc1-08deb1df7687
X-LD-Processed: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 yabxJvInDmGNza+etB3GCDRROJaq47NZcaRTAz/G8Fv+WbGpldEAMjAWsVYhaX639I+Ind4AmyBj11/UMv6nB2wLjDCYXxzQXbdaAfMXMjb/F8WEHJ1l7wd6hKgI4JP643mVIg0A3bGijRNOPd4UGzYMRW6XFm2oDBiIzx++6AEUEKsA8/bsBUIE+oQjFtNEaq50jbKHErClCTufd7l2LTNaVzbU7eNrXll9L5Z8H33dA49Dw9NtHBkF1DYZxrFesjcD8wo4hBw8QpvesooFhAHcda/Q3hY0gedOmLDVnW0TVsDmfFzZySbtXVm+lt9A8jr0rrkplhR6/+STvhUf/9eBYvOI9ykG34pK5Af5k/K7ddR7V1NabdFwW/gg1PZvXzv/cnWBpgWzuuO0hgWQ/7I48kgn/nqsTeDTeTcOfgF83Hu3LTGjOyU0zgMx4aYvRkthglZEnZBnQHDLdbtniAY4VdNvWDsGvOcDozb+GFApagzLmZbm6ogq27rU1ChPjT5AuQLr+2nhQbmHZ3V+ANTdWUT3Nk1+iXoPSHPbOY+RiZKDok8qcGSbSGfdIlXH0AE1lOtwfXKGS/yNB7m19qX+QCws/DiHddSN46zBknAQ+Rm8sWBp8p7+mG+GL2X/nN+A5ompTabm5jPkGgCp7g==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?b3BKZ0VyT21SVG1BNkhxcldiUWZDQklGNE1MZzJOdlpJS2JMU3c3TGtkV1R0?=
 =?utf-8?B?dEdNbUNHeGlOeVB1blpXblp2eWliaWpodlNhWjlhVWdjbDlNZERPWEY4NTdq?=
 =?utf-8?B?TGNLajgyd1lpOCtsS21TNXhmMTY4aUtiUW9NTlJGTDVWeDEyQWphN2xBS2RD?=
 =?utf-8?B?Z3pLV2Yra1ZFODJKUXN4WnFnRUcvSkJTa3NNSG1KcFR1UFFGKy9sbGhoa2Z0?=
 =?utf-8?B?TVZ3VkxVSXFZdFhJTnZSSmhxNDVvamNyaGRFVGRzNmdDa04wbFhlbEVtVXlF?=
 =?utf-8?B?UTdJWnFJQzBWNncreW5vb0xjUHhwOHVIdW4rUUh3VW9wb21RZ1p0Q2NHVTVW?=
 =?utf-8?B?RTl0K0J4T0xYQkwzYVpIaWdpZk53V0lObmFjci84T2JGZkd2WXpzNTRRYkd2?=
 =?utf-8?B?bGU4RVJsVnppZ3c1TnRGMG10S2xSeFllYWNCMEtSN09rN0ZwNXhvWlo1OGdw?=
 =?utf-8?B?MU9ySzcrQXVjV092blpUU2RBSnNDcXZBQ3BjNmV1L2I0VGFsVzYxdXZpMDdx?=
 =?utf-8?B?UlBJNXFSZnVsS2k2Q2djVmpMTkM2SU9kRFRJRVVZNG5NYzJqVyt6SFRIbVJa?=
 =?utf-8?B?cGVJc1lWYkJ5TEppWWF3Z1RKcFhUeGpCc1J0SW5PaVhkUnZ4aUJHOUo0dkI5?=
 =?utf-8?B?UGpLbFdBZzR2MTE5ZDhMbHJ3Mi9xSVpwSzFKTWxMakZib2tSbzJ2NnowYSs0?=
 =?utf-8?B?RkphMElTdWpLU3BEdDF0SXlYeU1CdHNRa3VUOUQvYW05VjlPSjhzTkIwMkpZ?=
 =?utf-8?B?YmJZVmFiemdQZHVyRjZCTmdkSFNxR0dVMWV1M1dBc3ZaMUdDQ05YZFZDN3ZN?=
 =?utf-8?B?SmgxeTU1eGhJejJrTDJESzF1Y3hwY1NaanRjNGFUd1NkRkhxN28vTFhKRUVM?=
 =?utf-8?B?blEra29aWGM1YzVRelc1OTVFKzdoZFJQZ2kwYXNkTWNodjRtbURBQlFUOUhR?=
 =?utf-8?B?b1FQOGlyTGg1OXppMVd5UlhRZHpOY21nZUdxc05WemRwd1ROWGRmNWlUMTVC?=
 =?utf-8?B?TElTM2x5MVBNNEpBV3B4bERuMlZNRmxOSDNNMGJqSXpKUW9rWWp0YlQ5L3Ix?=
 =?utf-8?B?aktadlhtNGwrNEJMalBiZXhQRlY1eldtUitXMXJRRm5scEdxVG5KWDdpWFBM?=
 =?utf-8?B?aGphenFhYnlRdVdnSVcxWDB5a1pHV0t2T1BNVmNGU2VoNEVyUTRYUzZJR0dT?=
 =?utf-8?B?K2pPTml3Z2JxTFp2eFovS3p2RS82d3hacmFWN2JVQ0tTUit0WVZaSnNFSEhL?=
 =?utf-8?B?eXFnNVJQbnpVb1NrSlRjam4rcE84ZVVyNFJ1VW50SUJkNHZZMGpRY1NYZHJo?=
 =?utf-8?B?akFuTE44OUMvQWZndnpqSXhOSkJWV0N0NC8vS09MVEQ1WUhWR05HQ0pvTnFr?=
 =?utf-8?B?T3ArYXFRWFhnbFJLcEZESDlSUDhlRkxraGNmRVJ2MkRpdG1jR2pvblAvQTJt?=
 =?utf-8?B?WlRjN3hIWWtTazRkTUs1WGlyc054bXQ0WTlQVjVmK1dCVjBLY3hKNzRQUHNR?=
 =?utf-8?B?ZjdON0VhZ28yRUczenI3SXovU2taUmNhbGFjSWowanFFazZ4V3oxaFA5MklY?=
 =?utf-8?B?M3J4eTB6aEx1dlJpVU9mNHl1TytQNUwyK1RSU3VsSHh2Ujhvc1lYdWJPVVVK?=
 =?utf-8?B?S1VQWDBNS1ZNMEJ2cm9BRkp2Tk1aQkYveVdZZmNDSmZ4a0RURHRmd2tJa1g3?=
 =?utf-8?B?YWhqUHI1cUZhVVgwNk1QQlF5ajN5Z2VQZkx5c1kySlE1VkE2NUUzdGcyZWs4?=
 =?utf-8?B?NnJRNVJDSHlLMVdzNmF5U1lSc2RPcFJpWlVPU1RPSnV5THVQZHdtOE1KUk1i?=
 =?utf-8?B?dnZSaThVR2M2aTZwM0p0cHJXcFNDRDdqOHZ4VWpINWVLL2xtbGxDb0QzMEZj?=
 =?utf-8?B?ZjdIZ0lKcXhna3NsNDJMYlNDM3dtcCtOcE1Xc3hlTC9wWFRGNTlHemptbmJk?=
 =?utf-8?B?TnZCVWtrb3lyRVJuUVFWd254TTdrcUlENDFsQjg0QzBReGFBdG96anVPVXdQ?=
 =?utf-8?B?ZXV3dGd4Qlh3bHd3YVFuNnVhUGh0dlYxVW9QVTRjOU9IdFRjcGpxeElvZVJU?=
 =?utf-8?B?UVJmOEkyT0JIZ1pTeVZieGllOTVWdVdoMWpXTlhoVlIwZVY1d05QL1puRlI4?=
 =?utf-8?B?Qzd1eUk3UVZick01SzR1YXhONStadDk5MFYrVUUvTDUrL09zYi9YWGxoK1Nt?=
 =?utf-8?B?QTdPMFlSV01qUEZhRVVva0JLbmF6WG05U001WmFuN3ZYbjIvTVVudWxCZWQ0?=
 =?utf-8?B?cXNOYUhqT0M5ZUhoWXM0WlduTmNFejBOMy9PTFlLUlduQjNLYSt5ZFRWYmJW?=
 =?utf-8?B?M0VseHkwVTUvdEQwUXlnVlhzK0R0bUNUbE1NRXdaQ0tOSXdqUHF1QT09?=
X-Exchange-RoutingPolicyChecked:
	UUCCokFYFjrE98XJCx7k8tq1A1evQANk9OC10O5gBq9nHeYsvpPkQ+MaQgWzjxQLdiuvGMYYzfAMzXBoP+MjJY6PiVIMz/ouAEVIhw7s4Mwb24Whyzc5lKl49cLTLFcF61I9VHE5rP/dyk2WFspqdK5qWGkrhk9ekrs/kn74I77h11FMFiiiGGGCc0jqh9J68PoeYpcdMDePlLUpJQqG8PFTHyLbTuK+4E5AC+fdIsn3DGJhCdSxOHaEMrwMX++dh7HNct3HxJR7Gtb5HeqvcavYubSkpNHyd1odO1IfL80DXsLWonOGd1Ip+uOciJhKvEvSCYXbCUQzoZu3q93XfA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IMgJzJu4xCBHRUON6qizZseL30Sysix/zKf2VAxAHJjiypvzbatJWirhP3aq7foAmI1WrhLVWHCtKWQjlYb1Vrsvi+FONUkS2oSOi6QnUYrwMwMsgc/XVPsELj+MBNiV0hmTSCqyolC0uetl4C8rAFY+2QAyE4j0k0N6o4RKUEusQNtppZ7OIvC6HJqA88vdQ8vJFWtAzh/kxTgo/WWJybP/1oT4jbx9bCqCji5kHHnjYKyx9F1syTX0sxCSnPYeHKk/E46zhTg7c/+QiV0nicsRWRG9R/UroO5Sy6tzA1OqiAbvv4UqRlcAw4QMAFMUDR6fTOY95DZQKBYZ/+BH3ZgSQKzCT4ADCQa3WJlqcq72hi5eWYs36NJ8lOMrZYDP3UZcdALyoybM3nmwOuNLFGlD9c7kMG29Vvodrh7OBIs3JawHyNJzZiaiD6wcF7eLiyXX9tgSFqsFHaCTu7NZB/qsFTsYLa/KkNfVHpkhwD9crbxOajm3Q1cl4ltgkW/xF+NBDFBf2OLlfH3MDBcY+q+x/+AEriIewEI4GSWaCc91S7+bMl3pA0Q41MkR/YjlGTlDXKLaR094tk5eMHWIZFGX268ET5rho1b7A/mMv0I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11986f2d-675f-4cab-4cc1-08deb1df7687
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 17:37:25.9224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 66onfnF2lPCSkB+BsPMCpuDxt5aNiBIH4I0RR9Gus5b8H/p6I0O4TTyN8NWCcT5LzWrgWmenGE29DwfNtjfF/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7034
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_04,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0
 phishscore=0 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2605050000 definitions=main-2605140176
X-Proofpoint-GUID: Naj4eVeYFQsffuTGOFFN4pK9g1pu0oQm
X-Authority-Analysis: v=2.4 cv=AeCB2XXG c=1 sm=1 tr=0 ts=6a06085d cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=3I1J8UUJPc9JN9BFgKH3:22 a=VwQbUJbxAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=Yc1lpRBbSvbj8zhg0MwA:9 a=QEXdDO2ut3YA:10
 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE3NiBTYWx0ZWRfX5+ixEIHyNZbT
 Y9AD4Y+GLdbCjtPJAuGyvPsewrq3x2/UutMS+4sOOJLEbx0E2MHcwUyy+xUutUfjNdPcVaeQ5p+
 2FZbpgKmbJiBjfZVux4F/92bgNy5HblYlvMz1/JMmab0tfzdxrnuoSQhptx7w1DcyECXp1yxrOw
 9yEj1kYqNierFn51atLK+f827PE59fmnsevJp78oPSd0Al7jG4rskbR8oq6YTcUymKjAM7PPZA4
 HZtPV+dO3Yj4RsqKOqYeq+2/PcndTMMCkd+MG0cuQtnEdEXPQ7WhJW6Z8gdnlFWhRKlzEMSVHko
 bywBWD7DB5e6ya6TJHwFqmyt0pXgzFiuNixKoqBUUwyFGaOgdwxZUpeSzektIMGHqgG63vmWLQh
 9EiUvyl95wap2DoT131znUPr+OytcNLDN0jX+SRNYM6Wt4QnViIVRx1oJrJZ3doAPhwIJzFVJrA
 hBKEf/WLfKA25WcTY8g==
X-Proofpoint-ORIG-GUID: Naj4eVeYFQsffuTGOFFN4pK9g1pu0oQm

On 5/14/26 1:03 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   e1914add2799225a87502051415fc5c32aeb02ae
> commit: 6f57293abb8d087de830dd3f02e66d94b3e59973 sunrpc: Fix compilation error (`make W=1`) when dprintk() is no-op
> date:   6 weeks ago
> config: x86_64-randconfig-121-20260514 (https://download.01.org/0day-ci/archive/20260514/202605141218.uA0wk544-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141218.uA0wk544-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 6f57293abb8d ("sunrpc: Fix compilation error (`make W=1`) when dprintk() is no-op")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605141218.uA0wk544-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>>> fs/nfs/nfs4super.c:232:17: sparse: sparse: incompatible types in conditional expression (different base types):
>    fs/nfs/nfs4super.c:232:17: sparse:    void
>    fs/nfs/nfs4super.c:232:17: sparse:    int
>    fs/nfs/nfs4super.c:255:17: sparse: sparse: incompatible types in conditional expression (different base types):
>    fs/nfs/nfs4super.c:255:17: sparse:    void
>    fs/nfs/nfs4super.c:255:17: sparse:    int
> --
>>> fs/nfs/getroot.c:90:17: sparse: sparse: incompatible types in conditional expression (different base types):
>    fs/nfs/getroot.c:90:17: sparse:    void
>    fs/nfs/getroot.c:90:17: sparse:    int
>    fs/nfs/getroot.c:98:17: sparse: sparse: incompatible types in conditional expression (different base types):
>    fs/nfs/getroot.c:98:17: sparse:    void
>    fs/nfs/getroot.c:98:17: sparse:    int
>    fs/nfs/getroot.c:114:17: sparse: sparse: incompatible types in conditional expression (different base types):
>    fs/nfs/getroot.c:114:17: sparse:    void
>    fs/nfs/getroot.c:114:17: sparse:    int
> --
>>> fs/nfs/namespace.c:304:17: sparse: sparse: incompatible types in conditional expression (different base types):
>    fs/nfs/namespace.c:304:17: sparse:    void
>    fs/nfs/namespace.c:304:17: sparse:    int
> --
>>> fs/nfs/fs_context.c:1120:9: sparse: sparse: incompatible types in conditional expression (different base types):
>    fs/nfs/fs_context.c:1120:9: sparse:    void
>    fs/nfs/fs_context.c:1120:9: sparse:    int
>    fs/nfs/fs_context.c:1123:9: sparse: sparse: incompatible types in conditional expression (different base types):
>    fs/nfs/fs_context.c:1123:9: sparse:    void
>    fs/nfs/fs_context.c:1123:9: sparse:    int
>    fs/nfs/fs_context.c:1126:9: sparse: sparse: incompatible types in conditional expression (different base types):
>    fs/nfs/fs_context.c:1126:9: sparse:    void
>    fs/nfs/fs_context.c:1126:9: sparse:    int
>    fs/nfs/fs_context.c:1591:9: sparse: sparse: incompatible types in conditional expression (different base types):
>    fs/nfs/fs_context.c:1591:9: sparse:    void
>    fs/nfs/fs_context.c:1591:9: sparse:    int
>    fs/nfs/fs_context.c:1605:9: sparse: sparse: incompatible types in conditional expression (different base types):
>    fs/nfs/fs_context.c:1605:9: sparse:    void
>    fs/nfs/fs_context.c:1605:9: sparse:    int
> --
>    fs/nfs/super.c:1170:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct rpc_xprt *xprt1 @@     got struct rpc_xprt [noderef] __rcu *cl_xprt @@
>    fs/nfs/super.c:1170:49: sparse:     expected struct rpc_xprt *xprt1
>    fs/nfs/super.c:1170:49: sparse:     got struct rpc_xprt [noderef] __rcu *cl_xprt
>    fs/nfs/super.c:1171:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct rpc_xprt *xprt2 @@     got struct rpc_xprt [noderef] __rcu *cl_xprt @@
>    fs/nfs/super.c:1171:49: sparse:     expected struct rpc_xprt *xprt2
>    fs/nfs/super.c:1171:49: sparse:     got struct rpc_xprt [noderef] __rcu *cl_xprt
>>> fs/nfs/super.c:1307:17: sparse: sparse: incompatible types in conditional expression (different base types):
>    fs/nfs/super.c:1307:17: sparse:    void
>    fs/nfs/super.c:1307:17: sparse:    int
>    fs/nfs/super.c:1333:17: sparse: sparse: incompatible types in conditional expression (different base types):
>    fs/nfs/super.c:1333:17: sparse:    void
>    fs/nfs/super.c:1333:17: sparse:    int
Andy, do you plan to have a look at this sparse splat?


-- 
Chuck Lever
