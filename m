Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324A23624C3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 10:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781174844; cv=pass; b=Hj+rjEBWlXsY+eOOXZVN4G+QXfdW3KyubN0NxO95f1DCCszRgCxNXRxNyWbOPjM3FByLiRozvvcSvNVxjRYd50MGMqEOHTb4QKW/06a0ENdHv6NxVYXF3OajmZQOZLH9qFc06t47RXb7n5kUW6cglCBGVe3vIKVWWa4F2zgm6QY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781174844; c=relaxed/simple;
	bh=L+XsgchiljswfA1IpbEmqrQNLc8tlDLGV1UdNOeAxwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cCY3b8RL8ExS1uNPdKp28ly6rBaL6x+XdhBm3FsLBp8S9BCrcIji+POZLMey494rhKciW7lf28lz1J5snb91jTI1fiI4Jfy5Gn+z7/1ekmGVUo9Gf5Tepzv4fmExSe2Dz5sjsmtCLub/WHFOk2eohPpXCkprHj3kC2R9kHD+LKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ReIUGV79; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=amOht8Pw; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ReIUGV79";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="amOht8Pw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xpRn214478
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 10:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Txnep8iMEaX6d4v9f9SspTXDI9luWLyelvApIJYs68=; b=ReIUGV79xck5AQQ4
	xkZPhVgkr9lJ4DRAficRGZxGeP3ZfQS0+UrtGxqlQQ21SNfGZm9wzoR1FSPI7X8O
	GU/6PndRFpL83VPNehuDcgHhLVbXE9W1NwdqP/o4dTxjXtkdYmGmHmGAnhJwFJL8
	zvqLJwZEm0Mmbl2Hk8AihRKYG4G/mCuAuh7O9itX17KF93ZrGkJK6k0zi6AWsKw+
	pvrFCbhYnuP9qdUk6eTkOi5BsG7jcNDOCaP/DzFVRzvk20nloYmFbyp8EUN7WXl0
	NwxR/nnCSmfx11JZS2UkvZbJ2bRRDd4fFf4fpD69pG5UsxZ7WyUo5oAAhwaehdbF
	91zRbg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6sk2yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 10:47:22 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8cced2dabc1so150539016d6.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 03:47:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781174841; cv=none;
        d=google.com; s=arc-20240605;
        b=HtHT2crYjTR8Tb6Ioa9pEuddeP5Zpj2FkU/vWfsCuX+Oc9BqBH6+N4kQ8197qaE/bK
         HWvwCyhIIQ2Oqeahnc66sDkj+rjrwa8XNP8gtkCWskuFhGuLVxL12TymRAdihkEJg6JC
         JFiFcotiRGxxLgGrmETLTRXhKff4+/LeKC4MggdeTog/2ehDY2uu5FcOc5l7unRkNkBX
         gwUN9CF0BrKUu7umsc2vAalzSfpBSzI7QJb4RhChsynDfdSuArOWy4rifXDqx6cwak3p
         vEgDygt6l8GGsbrQTMC7JGqeHYKDlDJpE6YVa2OeXpdmi8uj2Fy957GW5/RtVoz20y+O
         sp/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Txnep8iMEaX6d4v9f9SspTXDI9luWLyelvApIJYs68=;
        fh=QoXowjFVCAto/lqpwaQ16/w2erkC6OLaYzi03Je7xa4=;
        b=Xn0cCMFq6V0KnnHv5X58GuqH+ckkOOcrv51QDpATet4lRKkNkjACqXyyJ+dk0nKpBY
         2vDRolOdIlRIc4T+HzqUe6p5bIcr0LTwWcdgQRTlOE4oDX+okAIdRL4nDhAmJbctX0R7
         qXVCgSJO1tz5QVHgoTk7Ovp7Y2Fwy1lihZ92XNwrRoXazjrDi65Ve2Q8GwdFqamRk9wa
         A1Wj4WCycmKHza2Puesrff0jI9NCGH1nLfMMzNI8hZfJuyx7OoLHFhZzy2ALTraEuYUx
         INRtyMnEaj/Kt9kvtiJ5OVb51I2L6Y9dYEdrQxa/ed6lB9p3mLxq0KCPQzRuaqEHB8kr
         TYaA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781174841; x=1781779641; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Txnep8iMEaX6d4v9f9SspTXDI9luWLyelvApIJYs68=;
        b=amOht8Pw3+0B5SUDSvgJ3tN61Urz40/DFYUr+uoikQyqARLl83XE0J0COVBZIPtz7C
         brrDb7SA8QYJjY/NdQFKzntiFvqST6jox+y8mqr6C8GJZrpaplZEHlqgcpV7o5kTUteu
         H7eQcQxE72l8MGagLiuLI6/oRb115k4/yJT+TpbApLfBwarIKuCF6XeaVfn5ShE3VuoS
         55f5VUP+ikVyRjC3ZS1voDSuSa0lasPUvxmZXWXjDGZ4V6QjVMqhtRC2OdcchrqYLPaS
         kVKdH/GCrie/n9hiatWVB5Ro/52yRh+Be4z4XljuNkitoBDkbYUaUAsf5CWxcdw3vvD5
         AIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781174841; x=1781779641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Txnep8iMEaX6d4v9f9SspTXDI9luWLyelvApIJYs68=;
        b=Av4cVtee6k5+nvqTfct3f2+n/lK9WFvC0wRxzpxSDsImSZAxzR1mP0h46vUC1wxmVd
         6lqwWO+JE3mBom2j+tWGfPHBx5KE3xWEA8pdrprZN/U8EsNBw+iyG8ErlgRv0aF8pR/M
         tPubizxOJDxA0L91HisNpz2SWMAt1YmlVdlFMAl48uohSFMWBLbQq2uTcZeNTckRA2MT
         XIwNvIl+tLcWXITbjCvHrBH7Z/JcTqOgjYZzviWsBME5CdljQzsx5TAOIaG3ufSXa3Yi
         /Rw86XKFX2765sbsGhQDw7EwaIaRxe6ql7DrNLJNUxRdP92E3zvsZXe6FXzICCJ1llmD
         H5uw==
X-Forwarded-Encrypted: i=1; AFNElJ+McG0Zx6DYZ9Smmt83wSdP2TLM3eKnuX9rCMSbZ4TOuTffZnnOjbfbulXfaWqI9mxMmI5L6IP0kMgZiTXA@lists.linux.dev
X-Gm-Message-State: AOJu0YyONG2ZnJ5sZ4CuxWpoBCCrYBJ7q8J6ejyvMDPmJg9KziKnrfO/
	p6H8gAheSb6UztqzxcP8ElJg4tN0fLFTtDY1IhELXjLnE39yOIaCBKixQemk+dYekmKBXjr1/FA
	iy/IkUFsRp5Xc0uv0I+tptFb08XQRVBBnNCTBBtNBCxnrzuWk4R+mNWySfwIJgbZu90z4ysZ+RE
	+e1h4G+C6n+vjooFgQPHz5+7MuYfS8PEJS9pp1nkZnUns=
X-Gm-Gg: Acq92OENtEULCo9GAAkNrO26xRlHy7rXIhWnhj5GUQHbXJ10YFZdc8v1xFiZ4WhgTmy
	IuhHy1Bi21SwZC/SrIEz2LakbVuK97mVeU0mfeZRRCL0lCDQxaEmO3k+pCyEvTxK8gUMyUXLecV
	XF5gnr29i6IsxykGIaR1WiDI/qDWbs6+MkO60GiscSG25cMJ5jgpcSLZ/sc2b0gae1TIWfL1pB3
	uGs10ZDaNXNIuSdYg==
X-Received: by 2002:a05:6214:5a01:b0:8ce:aace:eaf8 with SMTP id 6a1803df08f44-8d1db9d60d2mr33282786d6.43.1781174841365;
        Thu, 11 Jun 2026 03:47:21 -0700 (PDT)
X-Received: by 2002:a05:6214:5a01:b0:8ce:aace:eaf8 with SMTP id
 6a1803df08f44-8d1db9d60d2mr33282536d6.43.1781174840974; Thu, 11 Jun 2026
 03:47:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202606111746.kAxaAbwg-lkp@intel.com> <aiqIx_ayahpHI_oF@hovoldconsulting.com>
In-Reply-To: <aiqIx_ayahpHI_oF@hovoldconsulting.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 12:47:09 +0200
X-Gm-Features: AVVi8Ccf8h5eFiwbHJssZFMFX8GhQjqSYNjKpdrKYVgKiA4I2fW8pztkYRVryLY
Message-ID: <CAPx+jO8-wvkXh84+kY2rotRU7Jr5RC68bF0HeWEC=bTO1uAoDw@mail.gmail.com>
Subject: Re: [ulfh-pm:next 12/12] drivers/pmdomain/core.c:36:23: warning:
 'genpd_provider_bus' defined but not used
To: Johan Hovold <johan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
        Ulf Hansson <ulfh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a2a923a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8
 a=2teeSi3xk2FzZ-70JW0A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-ORIG-GUID: HStm3bt7A4Y-QXQ8JLPgLZYmTlLdK0QK
X-Proofpoint-GUID: HStm3bt7A4Y-QXQ8JLPgLZYmTlLdK0QK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEwNyBTYWx0ZWRfX9UpmUGVg5WWP
 +aXuZp0oqhD1pcjC6udT9lKVrkfNp35WLoGhoma9MWMuonH5NfBP0uT0fH1IoBTk1GPsk9uxLWy
 QXAEB/DXppIAYTzgvMCt0BS6Z91QGCWw/NKBUf1/9V/wkcE78bNZ6fon9RMJgTYHgYNKbEJh8w/
 kfssfG2/vC79hK+MoFT2Ix55chPqropcXfQRltvTRHo77PInk6feCnXSOLj1RzSwSgF8h4eiXec
 pbAlCM7dfjf7hqhFL/RatFXQHkZoQhtIWgHCopSR6Cgco+v2r9cP12iHFoGymdI+ct5foxUVqkF
 jmG0Vrjvf0CfHwLGgRwHZM+RBOH0nvAAyYiwLgTKeWuoacxsIPPagjVm6Tsss/NZ4MpG9Z1Vczp
 7eVDW5D6Mi6arXyf4rLPFcz6oJpLafhXUJFr9R573G4l+NQcRDhE7/UMSwQJ6hyFPLhk9LHnkWM
 T+XOnjvDDNEwdRtCL9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEwNyBTYWx0ZWRfX/9Hns3CIjBp+
 7rJR71KiS5pbKkevYtIa7iu7hRJJyEAo0hTLVvX63vkykLFHbDE/SKC3P2ks+Y0LPHXA+vNml/8
 MiNj0uW/fP+cvA919dT4io4hmTz8WIs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110107

On Thu, Jun 11, 2026 at 12:07=E2=80=AFPM Johan Hovold <johan@kernel.org> wr=
ote:
>
> On Thu, Jun 11, 2026 at 05:36:21PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.g=
it next
> > head:   ea1ca762328194de780a8e92df0b2e41bf6eeed2
> > commit: ea1ca762328194de780a8e92df0b2e41bf6eeed2 [12/12] pmdomain: fix =
early domain registration
> > config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20=
260611/202606111746.kAxaAbwg-lkp@intel.com/config)
> > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20260611/202606111746.kAxaAbwg-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202606111746.kAxaAbwg-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> drivers/pmdomain/core.c:36:23: warning: 'genpd_provider_bus' defined=
 but not used [-Wunused-variable]
> >       36 | static struct device *genpd_provider_bus;
> >          |                       ^~~~~~~~~~~~~~~~~~
>
> Bah. Apparently the only users of the bus are under
> CONFIG_PM_GENERIC_DOMAINS_OF so this one either needs to be marked
> __maybe_unsed or be moved inside the ifdef.
>
> I'll send a follow-up fix.

I suggest we move it under CONFIG_PM_GENERIC_DOMAINS_OF along with the
other corresponding parameters like "genpd_bus_registered".

>
> Johan

Kind regards
Uffe
