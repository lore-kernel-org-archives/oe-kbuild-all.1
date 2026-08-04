Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E8A36DA04;
	Tue,  4 Aug 2026 12:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846588; cv=none; b=Vb9d/I81TuYV+j1sKyZo6+u6z+aQInEd63jhLwcBDyXM88Y1800eGUp+MqL1aCfMrBLE7/UNPo8oM5Pgc2ygQmc+voYHtOHjM/yYuT8EVeIHa5SLPXukPj5Ea5s2heNryUfsn4mwLOGNydHJZ7MoKY1g1Fz91Xc9T3ficGge4wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846588; c=relaxed/simple;
	bh=oocZCrdhux0LahyrzdW13AJJIW+FOTtAHLi9b1bTSm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yk8Qdo9cUFCgZDKzGguGJpnj7PjP4OK3b5Ct0sIZ17aGj2eIr6pWl6yjti7fyLHzqODPPWwMQdr9vbCZs/d9WN/j6/KrgUHDeonpDhdZbhSyzO9dChGXtUuxG5NrccCm7ToV07LKd5m3uut2eVIrrvvFi+xyKlKrgm2d7yY5/aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=dUZ4HOTw; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="dUZ4HOTw"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748HXKf295922;
	Tue, 4 Aug 2026 12:29:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=dXgg3+
	cjjP8exzKIanU5AMTKlFdLKN38KPpqu2U1rpQ=; b=dUZ4HOTwLT+W4N+kg5PX7X
	gxs6ls2UNGKiOiU3EubkgkApcZJFMjPIf01TcTQuVxAeNmiT9agonolURYcKS/KT
	kaQJMaJkC8k4TWRFZjY/KK6navJLrre53HJCvUIjdYnq6mvv1JpC9q/Q6LrTFnwT
	TgWm0j9H6Zli12QaguyTVDVaCNzoD+YbaAcvKSip2iUYldcyQXWT5xXqkMZmtemI
	qX6sdmhIwd54KqOJCspCxbE0szXhEvsaOUfI21mG+yFZokyYt16+0iAm4kSP+Aex
	Dn2F5bY3abIDTmEgzls8yvTpvQKkvzCTQP2kb5ACxDv9EaWIVgIpl4vfn7JPrOVg
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fs8a3wsah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 12:29:45 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 674CQQT8001436;
	Tue, 4 Aug 2026 12:29:44 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fsv4k1vu1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 12:29:44 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 674CTgxb36569516
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Aug 2026 12:29:42 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 52DC520040;
	Tue,  4 Aug 2026 12:29:42 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7DCD520043;
	Tue,  4 Aug 2026 12:29:41 +0000 (GMT)
Received: from [9.39.27.209] (unknown [9.39.27.209])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Aug 2026 12:29:41 +0000 (GMT)
Message-ID: <08566cbf-532f-4063-9ee7-860a1246d48b@linux.ibm.com>
Date: Tue, 4 Aug 2026 17:59:40 +0530
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: htmldocs: Documentation/driver-api/steal-monitor.rst:2: WARNING:
 Explicit markup ends without a blank line; unexpected unindent. [docutils]
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
References: <202608031322.Mwzvo1FC-lkp@intel.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <202608031322.Mwzvo1FC-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=E6P9Y6dl c=1 sm=1 tr=0 ts=6a71db39 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=NEAV23lmAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=L6XSa5cvc_k_y_eX9skA:9
 a=QEXdDO2ut3YA:10 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-ORIG-GUID: 2bomeBcFRw0HyhT7rUd965GWOEPCYNq5
X-Proofpoint-GUID: 2bomeBcFRw0HyhT7rUd965GWOEPCYNq5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5OCBTYWx0ZWRfXz1HjAwjYrxIa
 GdFFGN1M8wC1kxKbVZQp0fdfa8CNq2M40aGoJRF/Q4UvyGH745RZXirLC5zdKmNhiUTGEYU4oIR
 +JgBEmAZPJ52u0vDBaZG0NzvrOntL6o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5OCBTYWx0ZWRfX+GQZTiN5whsy
 muTxR/UUVU2y8IGLaU11hf5EG0QWtjeYQbAJbsAoq5horZSD3vAGxFzCHKi2PLUXtzCfuplbOrB
 oWPb3NY+/6DND4HVL4uNYX87QwHZarMswGEi0DJNOPSYKKMrgPjpsYIJgSsnLljnswxkCZi17rv
 ZHcgCj7lPQtXPBgisBuZHHlb2Mcl2pTObEmAPd3NawIFqCDnys0H2UdST1x+Kn5+spFWP035af6
 L/WBrbhyImrOsGuGBuwJ1yx51lY24M40jga8BbiaUhL4XOYUGuunqrPAlgOGiD6ThmdNrw58Bt5
 7z+rnkcmWBW9oh4Asi9Sza4zFPm65bgfC5V4Pf65kuux/yBt5OWAgotg1mCpycEGzRY6t7Pe/oG
 S5JsFDBwG+bEM4RDchPCaHTUROWQt3RvlENXp/wlkg+pwZTw9zlBzRCm4KjKRUmIkt9stQgL2iJ
 QcuHiLjH9xDS69pNBcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040098

Hi. Thanks for reporting.

On 8/3/26 4:42 PM, kernel test robot wrote:
> tree:   https://github.com/intel-lab-lkp/linux/commits/Shrikanth-Hegde/sched-docs-Document-cpu_preferred_mask-and-Preferred-CPU-concept/20260803-124520
> head:   6b51818cdef464c594cd8aeaa6f04a2f4ca1b1a5
> commit: 6100a3dbbee2530c908dde1eda5aff47105e4661 virt: Introduce steal monitor driver
> date:   6 hours ago
> compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
> reproduce: (https://download.01.org/0day-ci/archive/20260803/202608031322.Mwzvo1FC-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202608031322.Mwzvo1FC-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>     WARNING: ./include/linux/dma-fence-chain.h:48 Excess struct member 'lock' description in 'dma_fence_chain'
>     WARNING: ./include/linux/device.h:117 struct member 'show_const' not described in 'device_attribute'
>     WARNING: ./include/linux/device.h:117 struct member 'store_const' not described in 'device_attribute'
>     WARNING: ./include/media/media-entity.h:1394 function parameter 'args' not described in 'media_entity_call'
>     WARNING: ./include/media/media-entity.h:1394 function parameter 'args' not described in 'media_entity_call'
>>> Documentation/driver-api/steal-monitor.rst:2: WARNING: Explicit markup ends without a blank line; unexpected unindent. [docutils]
>     Documentation/driver-api/target:25: ./drivers/target/target_core_user.c:35: ERROR: Unexpected section title.
> 
> 
> vim +2 Documentation/driver-api/steal-monitor.rst
> 
>     > 2	=============

I believe it is due to lack of empty line after this.
I will probably keep the one below the text and remove the above one.

>       3	Steal Monitor
>       4	=============
>       5	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

