Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D949273162
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Feb 2024 12:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708952117; cv=none; b=hagJAVgNKTQnZd8HSQxB4VjLYPDvrtEPOOlHaUPAB2FetH7rUwEmqa3BFtaHn2HERDxxypSLnQvqT2fuv0/SzNPvkhKBx+dAS5dzYm87pTBFpJJwuYaMPqC8xCohNa6TNVsylwlfWm64Yeu8lXtqhyCA+BdYHBJUtzaFOHRwk6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708952117; c=relaxed/simple;
	bh=pxoza3HTK4aEM0yoDZZn3CQlIl4aJ5/4N0lcwlV+Vg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OCWJAZSIns9yHfRaWxg52T7Th5pNxujdCBohfGiU/GUjjdzAegw5Tr4+HO+bObKfWq8c03bNxdVd4ASxp2n+cAxouLoaW/7x5mzXd8+C2hMMI5gr6CvUeLnCZ50FagqZ8bl5hPDLXdJmm7HBhRXCBvaxWPLLXcauZtJ/W0bDgL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=aiF3CKFo; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="aiF3CKFo"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41QCrg0h019519;
	Mon, 26 Feb 2024 12:55:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=MTTKM4lAsqhrHQGT9bk4v2RhnpxvXSCKUbRyxVSpChk=;
 b=aiF3CKFoXgZVG4CbuH9tKcud+KWaa8WFw8g7AV7KXlGF0IFnlHqAIR2IgM3IawedvIC1
 xUZMZ4bvNOWafXPYMhUWMt4ZifSHtuBFPHL7wCvPJC0NZ9gJFG7DlFkTZ1ifYh8JN0cG
 FUpczilzOq5u4oQXyaUid/8a9nh9JU+0svbzmVTmGo/Neacr3J6v2Sc0zdGYxgToJqxg
 nPG04Pb3OeUmYMRHTCzmKAut8PR7OjIyFnbROhy/nMRNxNPXOLB51dxvhIeLPMXTZCx6
 RTvY8fRkXfjwofjPZDQpO3TqfVLNJgL2uEs3RFqHBCJ3V8sWYD8RVft9FGzPRX2Hp5RC 9A== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wgu1v811p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 12:55:08 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41QA6jci024144;
	Mon, 26 Feb 2024 12:55:08 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wfw0k0qns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 12:55:08 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41QCt2im39649648
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Feb 2024 12:55:04 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5850620043;
	Mon, 26 Feb 2024 12:55:02 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C88822004F;
	Mon, 26 Feb 2024 12:55:01 +0000 (GMT)
Received: from li-2b55cdcc-350b-11b2-a85c-a78bff51fc11.ibm.com (unknown [9.171.21.235])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 26 Feb 2024 12:55:01 +0000 (GMT)
Date: Mon, 26 Feb 2024 13:55:00 +0100
From: Sumanth Korikkar <sumanthk@linux.ibm.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: kernel test robot <lkp@intel.com>, s-vadapalli@ti.com,
        r-gunasekaran@ti.com, rogerq@kernel.org, oe-kbuild-all@lists.linux.dev,
        linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
        iii@linux.ibm.com, agordeev@linux.ibm.com, davem@davemloft.net,
        naresh.kamboju@linaro.org
Subject: Re: [s390:features 97/98] Unsupported relocation type: 21
Message-ID: <ZdyKJMEkm6r_ArrZ@li-2b55cdcc-350b-11b2-a85c-a78bff51fc11.ibm.com>
References: <202402221404.T2TGs8El-lkp@intel.com>
 <ZdhtYc9THmX4Ddse@li-2b55cdcc-350b-11b2-a85c-a78bff51fc11.ibm.com>
 <20240223235939.abycpq35ydgahdz2@treble>
 <Zdxt97Ni3p8ptNyv@li-2b55cdcc-350b-11b2-a85c-a78bff51fc11.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zdxt97Ni3p8ptNyv@li-2b55cdcc-350b-11b2-a85c-a78bff51fc11.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RPhIPv3wNwU_IlHXDnRJCg9vYUg2zR2v
X-Proofpoint-GUID: RPhIPv3wNwU_IlHXDnRJCg9vYUg2zR2v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_09,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 mlxlogscore=661
 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402260097

On Mon, Feb 26, 2024 at 11:54:50AM +0100, Sumanth Korikkar wrote:
> Hi Josh,
> 
> On Fri, Feb 23, 2024 at 03:59:39PM -0800, Josh Poimboeuf wrote:
> > On Fri, Feb 23, 2024 at 11:03:13AM +0100, Sumanth Korikkar wrote:
> > > In the random config generated by lkp test robot
> > > 
> > >  CONFIG_TI_CPSW=m
> > >  CONFIG_TI_DAVINCI_EMAC=y
> > > 
> > > In drivers/net/ethernet/ti/Makefile:
> > >  11 obj-$(CONFIG_TI_DAVINCI_EMAC) += ti_davinci_emac.o
> > >  12 ti_davinci_emac-y := davinci_emac.o davinci_cpdma.o
> > >  ...
> > >  16 obj-$(CONFIG_TI_CPSW) += ti_cpsw.o
> > >  17 ti_cpsw-y := cpsw.o davinci_cpdma.o cpsw_ale.o cpsw_priv.o cpsw_sl.o cpsw_ethtool.o
> > > 
> > > Here davinci_cpdma.o is used in both   obj-$(CONFIG_TI_DAVINCI_EMAC) and
> > > obj-$(CONFIG_TI_CPSW), one built as inbuilt and one built as module
> > > correspondingly (randconfig)
> > > 
> > > This leads to conflict in Kbuild and results in linking  davinci_cpdma.o
> > > in vmlinux.
> > > * However, davinci_cpdma.o is built with -DMODULE -fPIC.
> > > * vmlinux is built with -fno-PIE.
> > > 
> > > This leads to R_390_GOTENT and R_390_GOTDBL entries in vmlinux, which is
> > > not expected when building kernel with -fno-PIE.
> > 
> > Nice.
> > 
> > I suppose the current s390 memory model wouldn't support removing
> > -fPIC for modules?
> 
> Answer from our toolchain team - Andreas Krebbel: It should be ideally
> feasible to build modules without -fPIC on s390.

FWIW, I'm looking into this right now. Let's see how things go.
