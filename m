Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535F63D6471
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 12:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774356961; cv=none; b=tZZlAMIIlgCZGht5MGc4yQnCpsJRcbpXSBt0DLCCW/zmKIbgsOdCmj71LESWQyv/wA2+FtM2nx793ClFLM4D2SiptI3vp5Y4LQXeUD7TovUz9rg1Mc6PWTM+4rW+cBm4ErhW24R3Uj9ovNg3yb5NZQNkKnOIe+BzOkfgD8wdo+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774356961; c=relaxed/simple;
	bh=OZzCm0pREu38XtnmAUWuZI8sCEhWjQNUyllQZ03yeAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+bdaiEym5fHkRk+WcdM8PYHLlPzIWm0ZOm5Tc+0jVwdpGzGHcdsEwTuI004CRPce2X02SZ6Njo1jboW/YqvTXIAZTCbbxNas56C4NVV3lI4quV0grQuif0AnLAN1KqMHTufHxf8cEskELTodQbqqS4WymlMBkckJ6l8gLFNs7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gTTemTDG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h6bIoDAK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gTTemTDG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h6bIoDAK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O97OJx3934989
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 12:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=R8roXgboVbXmLAakQqmWnWPH
	OFL6HEqIKar4eXesNtE=; b=gTTemTDG1GsbjCLZHj6Vw8jfyIWzo9yapyLkPjnH
	IINS/aD62jOEF6hwY0Rp8vIVS4tsWZkMZy0YNW2xLnKKLJWsnJ/HW/ApPTdOTVFF
	bxGSalH0wwoivPMnk4u5sJvp6OLLRCoE9/Wq9ZdreZOl+7Uhr0qafFK7KT8KB8dR
	Bzez5AOwy/s3c6pHFIVCqbsu0cECrx56j4JGq5WHdwAhl0hh+E4KmNcC6ApREkEv
	VaE+63U2/P9UTHjr5wVymiEqFs3OJMO1qDil2AZt6hkwBCqxVZcDlj2V8Q0iT/YM
	SzUXNQ4nSYegv/zENHqJu1paIzxJVftuIYbZbbJTCo3WBg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0mg8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 12:55:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b061868724so43389235ad.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 05:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774356958; x=1774961758; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R8roXgboVbXmLAakQqmWnWPHOFL6HEqIKar4eXesNtE=;
        b=h6bIoDAKW+ulmqHRnZlyNHae8PTenLUU0F49FkYYbzlqzqoiow+wJbd1bbJyNx9rj+
         ycx9u+aPn8H8l8z3PAQE0h6t6a28PgIJ/wBeqKKdCr2nGkyQdg/R4wUfrKYiFkFDHnCi
         8KfXa9F8nPbwH8rsVri2NtWiMo5O0WUp2kKHm7XsE7yQErcZL9aclWuHgTIkr4lC0WkF
         ucRLQ3wDxQifiL5E6GQzb0OXH0Zriqv8sZ3lfsMjalwp/4sED2qhUbPUlKHpafxTlG8O
         tGg8U6XPBEHXxQkryt+iDbR2KUza+Um/E2CQuz4noIDKFAKvMU7Kr8uQqvbXSKVTHAXh
         7H/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774356958; x=1774961758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8roXgboVbXmLAakQqmWnWPHOFL6HEqIKar4eXesNtE=;
        b=sVM58iyQB38Q3he07C57au1px8kgxjnzuFv3z0x5mMJEIIsHrgAS1jyvv0hpJV5I61
         J+bGudtRMroc2G0PbJ2sv4Z0L0mKU7NtrU0zSHsNW5HnPRzQVi3eoCCFmO74VlLXIstw
         /cuWYxVanvdMrp0OzKKLdo1jFBJGUi/ZFiqdz0VCfISgF5cuZ/qtfU3oAza7NUemQCmf
         3Tk4ffP+MyQD4ZQuPy4qDQw6HT5fOBkZ1V8pWCqoYGXVrQO3u1tiPHC4v30UWXUsF2AD
         FRBCT9IrAC89fdZADZrg9+DF04ys54w7KhrEqzbXz6wGSHQm9HEbIt3RcPL89bGp8Y8R
         7lMw==
X-Forwarded-Encrypted: i=1; AJvYcCUYmkZI9qiA02OivhWtG3sbb9r7KVXxffmgY/atpntJcjRhnYa3+TDmllYQq+Pov/533hUge5xDzZIV2GTb@lists.linux.dev
X-Gm-Message-State: AOJu0YyT5CI7ITJQWB5iy0swle5IgkTImrQt4KTkEUPqA0zVqATmD+XC
	P63Yn9FXeee1dN77VTnLZozVTqjY1JF6OhhaRjL1ZVDdJVYsxtBQOa9ZdvsN3sxAKA4a4W54fAq
	Zrm0UxAxVyJq44TTIFI5+TFy1N0xriMmhetJbMv/6kKwwm0KatEJ7oFVbKLm2dPf1YwpJ
X-Gm-Gg: ATEYQzxHg/5im93qXN2sGb/l/5oO7tuLyf0pwsDf2oAtfFALetB5WgdX3xTk6tEVewe
	mo+zINjswlO9XFy4W4n2OF3oY9snlqPxZHUaoIgoC13Muun1VXTCaEQ3003D2zAIz7OoWCHce81
	OmcK6KBbwwaEiVDEGAVdMDaLC/6eyU09gIcozrElEK3SMq6+zCuaGPHASHEttk94kp1+cXRBlL0
	LeJMQLJk3uQX6d10dxfob20vE3enWdDXNZP6LlbV8gWrEHWPFzPUdxJD2P9nxeuyWnejqqACIil
	GFTWyrNlp1lbwHEav9eA/sfUUJDLgXWr8q5MZUgCtSclkZIr9bpgpTC/aPvaUrNYkfiFuiHuZw1
	sGbg7IZBzgUnX7tYIduStYAsPvbIfiYcP/PJ13tUpu90jbcrW
X-Received: by 2002:a17:903:2b04:b0:2b0:51f6:d46e with SMTP id d9443c01a7336-2b0826f6ce5mr154647395ad.15.1774356958353;
        Tue, 24 Mar 2026 05:55:58 -0700 (PDT)
X-Received: by 2002:a17:903:2b04:b0:2b0:51f6:d46e with SMTP id d9443c01a7336-2b0826f6ce5mr154647155ad.15.1774356957830;
        Tue, 24 Mar 2026 05:55:57 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0835298acsm151649845ad.22.2026.03.24.05.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 05:55:57 -0700 (PDT)
Date: Tue, 24 Mar 2026 18:25:52 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Map/unmap subsystem region
 before auth_and_reset
Message-ID: <20260324125552.q6czexiybos2r46x@hu-mojha-hyd.qualcomm.com>
References: <20260310135205.2497789-2-mukesh.ojha@oss.qualcomm.com>
 <202603190738.1VFMgKNm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202603190738.1VFMgKNm-lkp@intel.com>
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c289df cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=NEAV23lmAAAA:8 a=4kh2CpByiCJpsNi5vckA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMiBTYWx0ZWRfXyrJzzY89Puiw
 FsedZP8IaVIihI6EBEQ3uQaFxtl9FM2kIQxzWoBl9lOf/3OfVIcjs+fN+IeltU8zAawAc633bYD
 IynJUaB7+iZdW1VOsOYtgQAqmnO+XuQlEFlPMjxVikE99m2C6Wt7ySOI76esmbeQdx2AbXsCBcc
 cbDUmofDQFBywPVsFi3IHveGZLJ8s/jREM60LcCUzjIpmGOHEMylMo0RC/z5+TepQ6KLekzlQV7
 kHv2wHeV7xOvel4BFpoR0OwnM64dLfLKr24Cu5gk48dZxLBb/CFS7DDcy2s4sd9fxlBlioM3AqN
 /E9BSD+8duXdcYaJ1Y1VFJl67hyvFef8stjrBZoiSmjato55bx+NtWz1ZXjyeIIORKbTb9raflk
 3UV5yUVNY+CwcYllmcPCLRsgA+gW/J+cZKg0qHZs9BOE/MGmQNkwNuq6a8RsY/Qx3fpLEB2LmON
 T1VCksO5148skWQYTcQ==
X-Proofpoint-GUID: kzG0qRKjrhCC6Qv28Wg7CaTjIgb5e8Yh
X-Proofpoint-ORIG-GUID: kzG0qRKjrhCC6Qv28Wg7CaTjIgb5e8Yh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240102

On Thu, Mar 19, 2026 at 07:20:26AM +0800, kernel test robot wrote:
[...]

Bjorn,

Some sparse error are even seen without my change, should we fix them ?

-Mukesh
> 
> sparse warnings: (new ones prefixed by >>)
>    drivers/remoteproc/qcom_q6v5_pas.c:141:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *mem_region @@     got void [noderef] __iomem * @@
>    drivers/remoteproc/qcom_q6v5_pas.c:141:25: sparse:     expected void *mem_region
>    drivers/remoteproc/qcom_q6v5_pas.c:141:25: sparse:     got void [noderef] __iomem *
>    drivers/remoteproc/qcom_q6v5_pas.c:148:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *src @@     got void * @@
>    drivers/remoteproc/qcom_q6v5_pas.c:148:45: sparse:     expected void const volatile [noderef] __iomem *src
>    drivers/remoteproc/qcom_q6v5_pas.c:148:45: sparse:     got void *
>    drivers/remoteproc/qcom_q6v5_pas.c:250:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *dtb_mem_region @@     got void [noderef] __iomem * @@
>    drivers/remoteproc/qcom_q6v5_pas.c:250:37: sparse:     expected void *dtb_mem_region
>    drivers/remoteproc/qcom_q6v5_pas.c:250:37: sparse:     got void [noderef] __iomem *
> >> drivers/remoteproc/qcom_q6v5_pas.c:260:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *dtb_mem_region @@
>    drivers/remoteproc/qcom_q6v5_pas.c:260:28: sparse:     expected void volatile [noderef] __iomem *addr
>    drivers/remoteproc/qcom_q6v5_pas.c:260:28: sparse:     got void *dtb_mem_region
>    drivers/remoteproc/qcom_q6v5_pas.c:344:33: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *mem_region @@     got void [noderef] __iomem * @@
>    drivers/remoteproc/qcom_q6v5_pas.c:344:33: sparse:     expected void *mem_region
>    drivers/remoteproc/qcom_q6v5_pas.c:344:33: sparse:     got void [noderef] __iomem *
> >> drivers/remoteproc/qcom_q6v5_pas.c:354:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *mem_region @@
>    drivers/remoteproc/qcom_q6v5_pas.c:354:20: sparse:     expected void volatile [noderef] __iomem *addr
>    drivers/remoteproc/qcom_q6v5_pas.c:354:20: sparse:     got void *mem_region
>    drivers/remoteproc/qcom_q6v5_pas.c:481:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *mem_region @@     got void [noderef] __iomem * @@
>    drivers/remoteproc/qcom_q6v5_pas.c:481:25: sparse:     expected void *mem_region
>    drivers/remoteproc/qcom_q6v5_pas.c:481:25: sparse:     got void [noderef] __iomem *
> 
> vim +260 drivers/remoteproc/qcom_q6v5_pas.c
> 
>    124	
>    125	static void qcom_pas_segment_dump(struct rproc *rproc,
>    126					  struct rproc_dump_segment *segment,
>    127					  void *dest, size_t offset, size_t size)
>    128	{
>    129		struct qcom_pas *pas = rproc->priv;
>    130		int total_offset;
>    131	
>    132		total_offset = segment->da + segment->offset + offset - pas->mem_phys;
>    133		if (total_offset < 0 || total_offset + size > pas->mem_size) {
>    134			dev_err(pas->dev,
>    135				"invalid copy request for segment %pad with offset %zu and size %zu)\n",
>    136				&segment->da, offset, size);
>    137			memset(dest, 0xff, size);
>    138			return;
>    139		}
>    140	
>  > 141		pas->mem_region = ioremap_wc(pas->mem_phys, pas->mem_size);
>    142		if (!pas->mem_region) {
>    143			dev_err(pas->dev, "unable to map memory region: %pa+%zx\n",
>    144				&pas->mem_phys, pas->mem_size);
>    145			return;
>    146		}
>    147	
>    148		memcpy_fromio(dest, pas->mem_region + total_offset, size);
>    149	}
>    150	
>    151	static void qcom_pas_minidump(struct rproc *rproc)
>    152	{
>    153		struct qcom_pas *pas = rproc->priv;
>    154	
>    155		if (rproc->dump_conf == RPROC_COREDUMP_DISABLED)
>    156			return;
>    157	
>    158		qcom_minidump(rproc, pas->minidump_id, qcom_pas_segment_dump);
>    159	}
>    160	
>    161	static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
>    162				       size_t pd_count)
>    163	{
>    164		int ret;
>    165		int i;
>    166	
>    167		for (i = 0; i < pd_count; i++) {
>    168			dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
>    169			ret = pm_runtime_get_sync(pds[i]);
>    170			if (ret < 0) {
>    171				pm_runtime_put_noidle(pds[i]);
>    172				dev_pm_genpd_set_performance_state(pds[i], 0);
>    173				goto unroll_pd_votes;
>    174			}
>    175		}
>    176	
>    177		return 0;
>    178	
>    179	unroll_pd_votes:
>    180		for (i--; i >= 0; i--) {
>    181			dev_pm_genpd_set_performance_state(pds[i], 0);
>    182			pm_runtime_put(pds[i]);
>    183		}
>    184	
>    185		return ret;
>    186	};
>    187	
>    188	static void qcom_pas_pds_disable(struct qcom_pas *pas, struct device **pds,
>    189					 size_t pd_count)
>    190	{
>    191		int i;
>    192	
>    193		for (i = 0; i < pd_count; i++) {
>    194			dev_pm_genpd_set_performance_state(pds[i], 0);
>    195			pm_runtime_put(pds[i]);
>    196		}
>    197	}
>    198	
>    199	static int qcom_pas_shutdown_poll_decrypt(struct qcom_pas *pas)
>    200	{
>    201		unsigned int retry_num = 50;
>    202		int ret;
>    203	
>    204		do {
>    205			msleep(QCOM_PAS_DECRYPT_SHUTDOWN_DELAY_MS);
>    206			ret = qcom_scm_pas_shutdown(pas->pas_id);
>    207		} while (ret == -EINVAL && --retry_num);
>    208	
>    209		return ret;
>    210	}
>    211	
>    212	static int qcom_pas_unprepare(struct rproc *rproc)
>    213	{
>    214		struct qcom_pas *pas = rproc->priv;
>    215	
>    216		/*
>    217		 * qcom_pas_load() did pass pas_metadata to the SCM driver for storing
>    218		 * metadata context. It might have been released already if
>    219		 * auth_and_reset() was successful, but in other cases clean it up
>    220		 * here.
>    221		 */
>    222		qcom_scm_pas_metadata_release(pas->pas_ctx);
>    223		if (pas->dtb_pas_id)
>    224			qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
>    225	
>    226		return 0;
>    227	}
>    228	
>    229	static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>    230	{
>    231		struct qcom_pas *pas = rproc->priv;
>    232		int ret;
>    233	
>    234		/* Store firmware handle to be used in qcom_pas_start() */
>    235		pas->firmware = fw;
>    236	
>    237		if (pas->lite_pas_id)
>    238			qcom_scm_pas_shutdown(pas->lite_pas_id);
>    239		if (pas->lite_dtb_pas_id)
>    240			qcom_scm_pas_shutdown(pas->lite_dtb_pas_id);
>    241	
>    242		if (pas->dtb_pas_id) {
>    243			ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
>    244			if (ret) {
>    245				dev_err(pas->dev, "request_firmware failed for %s: %d\n",
>    246					pas->dtb_firmware_name, ret);
>    247				return ret;
>    248			}
>    249	
>  > 250			pas->dtb_mem_region = ioremap_wc(pas->dtb_mem_phys, pas->dtb_mem_size);
>    251			if (!pas->dtb_mem_region) {
>    252				dev_err(pas->dev, "unable to map dtb memory region: %pa+%zx\n",
>    253					&pas->dtb_mem_phys, pas->dtb_mem_size);
>    254				goto release_dtb_metadata;
>    255			}
>    256	
>    257			ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
>    258						pas->dtb_firmware_name, pas->dtb_mem_region,
>    259						&pas->dtb_mem_reloc);
>  > 260			iounmap(pas->dtb_mem_region);
>    261			pas->dtb_mem_region = NULL;
>    262			if (ret)
>    263				goto release_dtb_metadata;
>    264		}
>    265	
>    266		return 0;
>    267	
>    268	release_dtb_metadata:
>    269		if (pas->dtb_pas_id)
>    270			qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
>    271	
>    272		release_firmware(pas->dtb_firmware);
>    273	
>    274		return ret;
>    275	}
>    276	
>    277	static void qcom_pas_unmap_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t size)
>    278	{
>    279		if (rproc->has_iommu)
>    280			iommu_unmap(rproc->domain, mem_phys, size);
>    281	}
>    282	
>    283	static int qcom_pas_map_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t size)
>    284	{
>    285		int ret = 0;
>    286	
>    287		if (rproc->has_iommu)
>    288			ret = iommu_map(rproc->domain, mem_phys, mem_phys, size,
>    289					IOMMU_READ | IOMMU_WRITE, GFP_KERNEL);
>    290		return ret;
>    291	}
>    292	
>    293	static int qcom_pas_start(struct rproc *rproc)
>    294	{
>    295		struct qcom_pas *pas = rproc->priv;
>    296		int ret;
>    297	
>    298		ret = qcom_q6v5_prepare(&pas->q6v5);
>    299		if (ret)
>    300			return ret;
>    301	
>    302		ret = qcom_pas_pds_enable(pas, pas->proxy_pds, pas->proxy_pd_count);
>    303		if (ret < 0)
>    304			goto disable_irqs;
>    305	
>    306		ret = clk_prepare_enable(pas->xo);
>    307		if (ret)
>    308			goto disable_proxy_pds;
>    309	
>    310		ret = clk_prepare_enable(pas->aggre2_clk);
>    311		if (ret)
>    312			goto disable_xo_clk;
>    313	
>    314		if (pas->cx_supply) {
>    315			ret = regulator_enable(pas->cx_supply);
>    316			if (ret)
>    317				goto disable_aggre2_clk;
>    318		}
>    319	
>    320		if (pas->px_supply) {
>    321			ret = regulator_enable(pas->px_supply);
>    322			if (ret)
>    323				goto disable_cx_supply;
>    324		}
>    325	
>    326		if (pas->dtb_pas_id) {
>    327			ret = qcom_pas_map_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
>    328			if (ret)
>    329				goto disable_px_supply;
>    330	
>    331			ret = qcom_scm_pas_prepare_and_auth_reset(pas->dtb_pas_ctx);
>    332			if (ret) {
>    333				dev_err(pas->dev,
>    334					"failed to authenticate dtb image and release reset\n");
>    335				goto unmap_dtb_carveout;
>    336			}
>    337		}
>    338	
>    339		/*
>    340		 * During subsystem restart, when coredump is enabled, region is mapped but
>    341		 * not unmapped there, NULL check to reuse the mapping if its already mapped.
>    342		 */
>    343		if (!pas->mem_region) {
>    344			pas->mem_region = ioremap_wc(pas->mem_phys, pas->mem_size);
>    345			if (!pas->mem_region) {
>    346				dev_err(pas->dev, "unable to map memory region: %pa+%zx\n",
>    347					&pas->mem_phys, pas->mem_size);
>    348				goto release_pas_metadata;
>    349			}
>    350		}
>    351	
>    352		ret = qcom_mdt_pas_load(pas->pas_ctx, pas->firmware, rproc->firmware,
>    353					pas->mem_region, &pas->mem_reloc);
>  > 354		iounmap(pas->mem_region);
>    355		pas->mem_region = NULL;
>    356		if (ret)
>    357			goto release_pas_metadata;
>    358	
>    359		qcom_pil_info_store(pas->info_name, pas->mem_phys, pas->mem_size);
>    360	
>    361		ret = qcom_pas_map_carveout(rproc, pas->mem_phys, pas->mem_size);
>    362		if (ret)
>    363			goto release_pas_metadata;
>    364	
>    365		ret = qcom_scm_pas_prepare_and_auth_reset(pas->pas_ctx);
>    366		if (ret) {
>    367			dev_err(pas->dev,
>    368				"failed to authenticate image and release reset\n");
>    369			goto unmap_carveout;
>    370		}
>    371	
>    372		ret = qcom_q6v5_wait_for_start(&pas->q6v5, msecs_to_jiffies(5000));
>    373		if (ret == -ETIMEDOUT) {
>    374			dev_err(pas->dev, "start timed out\n");
>    375			qcom_scm_pas_shutdown(pas->pas_id);
>    376			goto unmap_carveout;
>    377		}
>    378	
>    379		qcom_scm_pas_metadata_release(pas->pas_ctx);
>    380		if (pas->dtb_pas_id)
>    381			qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
>    382	
>    383		/* firmware is used to pass reference from qcom_pas_start(), drop it now */
>    384		pas->firmware = NULL;
>    385	
>    386		return 0;
>    387	
>    388	unmap_carveout:
>    389		qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
>    390	release_pas_metadata:
>    391		qcom_scm_pas_metadata_release(pas->pas_ctx);
>    392		if (pas->dtb_pas_id)
>    393			qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
>    394	
>    395	unmap_dtb_carveout:
>    396		if (pas->dtb_pas_id)
>    397			qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
>    398	disable_px_supply:
>    399		if (pas->px_supply)
>    400			regulator_disable(pas->px_supply);
>    401	disable_cx_supply:
>    402		if (pas->cx_supply)
>    403			regulator_disable(pas->cx_supply);
>    404	disable_aggre2_clk:
>    405		clk_disable_unprepare(pas->aggre2_clk);
>    406	disable_xo_clk:
>    407		clk_disable_unprepare(pas->xo);
>    408	disable_proxy_pds:
>    409		qcom_pas_pds_disable(pas, pas->proxy_pds, pas->proxy_pd_count);
>    410	disable_irqs:
>    411		qcom_q6v5_unprepare(&pas->q6v5);
>    412	
>    413		/* firmware is used to pass reference from qcom_pas_start(), drop it now */
>    414		pas->firmware = NULL;
>    415	
>    416		return ret;
>    417	}
>    418	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

-- 
-Mukesh Ojha
