Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56D61DD0DC
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 11:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736162174; cv=none; b=c3oLQbMzflvLRD6NwIQ46AABHhPl8WtIf+wwfhLr9q5j/XcMxgIKTsb19MIvhZtVVdq+fdh/7VwBdTLWQ2MJgdLiwwalG+yOECpLAZ9MSdUsTMVXzvmbcK3Yi0vUKa1gyeGv/WBqDxiSnoH7kx4OPtoWIbRyzIfyP8oG0gt9fSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736162174; c=relaxed/simple;
	bh=O6C2GYZ1nSXjyomoMWBLCOezNaTin34/+fcjikzbwuo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hwZlAhthdCfJkvy1Rr1i4qxtGoqGb9NQ/KsZk9gYAkZo7MenWbM1rOeyjXSYI309T2kFGb/zUyMxfDGB94dRhpOSaRJPYct8Zz8/I5vjCPnZbr3fscwkQO9MR1L/jVBOteiajrLGGCvu0+mXe+vZSDUeb8rY9SAX+32L2Pu5SnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bTNlDKob; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bTNlDKob"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361f664af5so162360605e9.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 06 Jan 2025 03:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736162170; x=1736766970; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RaLAGnL/Jk0mHfwFhTVnY/JknA1BlI/NlBEd64HszCM=;
        b=bTNlDKobRxpg8JW5kue3HkLXsLbpwKBa25YUuZsJuL34V6NjhUcAegKSIRpIMK1dBc
         gklxTp5aPgEKL26Eu3lt/kC0I3PkF+kQf60K0X1fOJDa969M0byZs3vpDCLPCOGZhA6i
         b83S81wV1C5S0m3+xv9e3FZN61ZuPcx+TA8TPlMGnj+XpJRdiw/5LZgfPeg150jykPG0
         2DjG1pNXFbO3z/ik7iQ/Ak+D0G+8WzI4rYDDHRXdeS/0ChoFV3I0HCTJx7ttG3U3dN+g
         AhxCNFbF1luPq4NbxFwTL3hjfEu5kWmoFXjOOWdKUNuGB0n9kmkHmXIn5rnM9PJcjtXJ
         AK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736162170; x=1736766970;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RaLAGnL/Jk0mHfwFhTVnY/JknA1BlI/NlBEd64HszCM=;
        b=o2qZrDHSMh8tNhY61rtYFlSbxggjZpe2mup/9c0eZfB6dZ+UYesTtmc6iQBNF84t6b
         khvNQTS5L+mrSCMxCeO0pw2QGEF1d9lWCzQCqOUujdcmTGvoIFRKRUNfp6Q9aaY+8lBD
         gaeHyGnrGiiQcMjn9UJeU7OwmQlKS93OYjOal5HP/q8TLIr4tAt9+8m0A7CrnE8Zj9hm
         TpwkVDcqknFYxlYEOckDrw5045Jf3ggOyzqx7jhJCGRUiVC2B+3jDodh2+L6KD1H2xnd
         IQTPcMUgLfXo6J+TEW8yTKqyi7jCrntYE7V2jD0zEUGANa6DwP8mUjCBYvkXMC3gROPj
         OfqA==
X-Forwarded-Encrypted: i=1; AJvYcCXmr0A/M22ene2CeBSfXj0DoZj1e03dQw1io7Q+5n/XtlnmSLwYJTq+sDbMc+cmEZrD73pp0f2iCopuT2xq@lists.linux.dev
X-Gm-Message-State: AOJu0YwKesUAR+DoCycI2BBeVT22pZi9MB1VeBK75BbreEoDNPKZ1YmC
	AWtEK6gkA9NcbrIesKyRqo3jdx7zrIfL7S144lF7nKJq0Dox83m0rVAmXYBIntA=
X-Gm-Gg: ASbGncuCF62K01GfzVnICB/j+xXVOr9sJ7trAHmrDm0fqbjieNrjqpbSIQlXESA7+Be
	Rd74qjbl2oQWaqx2oPRyOANrHAKmVChhBcKuP3rOGl3qX6maWCs97SlU6CI6XIUDyHnKEzfv8+Q
	J6Gs4KeXwjYn/a9tu4lsxjBBi3HHbg6rCKF6u/A0PhDTnoZGJWuxn7hNRxbUdPaxd/BViZExVyJ
	hBVQCuGLGHISlxnIaLIjewN35C8kE7hPIV/ocub0LGmGkRDI5zNDE+Ns94CnQ==
X-Google-Smtp-Source: AGHT+IHHfvB81IlWX1NWKncUq++jCaYtse2JU5NWB0rqvt7+nipEXsqSHdSLvxqbor2rcxEdi4vKZA==
X-Received: by 2002:a05:6000:1868:b0:38a:4184:1519 with SMTP id ffacd0b85a97d-38a5eed02d2mr13627477f8f.23.1736162169976;
        Mon, 06 Jan 2025 03:16:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b119ccsm598362825e9.24.2025.01.06.03.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 03:16:09 -0800 (PST)
Date: Mon, 6 Jan 2025 14:16:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ronak Jain <ronak.jain@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Michal Simek <monstr@monstr.eu>,
	Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Subject: drivers/firmware/xilinx/zynqmp.c:677 zynqmp_pm_query_data() warn:
 missing error code? 'ret'
Message-ID: <5e13987d-3bdd-45e9-b16a-b2ece68c4571@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
commit: 92fb71333d5737d0296fb968a653dfda4b225175 firmware: xilinx: add support for new SMC call format
date:   3 months ago
config: arm64-randconfig-r073-20250102 (https://download.01.org/0day-ci/archive/20250103/202501031613.wYttNcqY-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202501031613.wYttNcqY-lkp@intel.com/

smatch warnings:
drivers/firmware/xilinx/zynqmp.c:677 zynqmp_pm_query_data() warn: missing error code? 'ret'

vim +/ret +677 drivers/firmware/xilinx/zynqmp.c

6366c1bac3149c Rajan Vaja 2020-04-24  653  int zynqmp_pm_query_data(struct zynqmp_pm_query_data qdata, u32 *out)
59ecdd778879f1 Rajan Vaja 2018-09-12  654  {
92fb71333d5737 Ronak Jain 2024-09-19  655  	int ret, i = 0;
92fb71333d5737 Ronak Jain 2024-09-19  656  	u32 ret_payload[PAYLOAD_ARG_CNT] = {0};
92fb71333d5737 Ronak Jain 2024-09-19  657  
92fb71333d5737 Ronak Jain 2024-09-19  658  	if (sip_svc_version >= SIP_SVC_PASSTHROUGH_VERSION) {
92fb71333d5737 Ronak Jain 2024-09-19  659  		ret = zynqmp_pm_invoke_fw_fn(PM_QUERY_DATA, ret_payload, 4,
92fb71333d5737 Ronak Jain 2024-09-19  660  					     qdata.qid, qdata.arg1,
92fb71333d5737 Ronak Jain 2024-09-19  661  					     qdata.arg2, qdata.arg3);
92fb71333d5737 Ronak Jain 2024-09-19  662  		/* To support backward compatibility */
92fb71333d5737 Ronak Jain 2024-09-19  663  		if (!ret && !ret_payload[0]) {
92fb71333d5737 Ronak Jain 2024-09-19  664  			/*
92fb71333d5737 Ronak Jain 2024-09-19  665  			 * TF-A passes return status on 0th index but
92fb71333d5737 Ronak Jain 2024-09-19  666  			 * api to get clock name reads data from 0th
92fb71333d5737 Ronak Jain 2024-09-19  667  			 * index so pass data at 0th index instead of
92fb71333d5737 Ronak Jain 2024-09-19  668  			 * return status
92fb71333d5737 Ronak Jain 2024-09-19  669  			 */
92fb71333d5737 Ronak Jain 2024-09-19  670  			if (qdata.qid == PM_QID_CLOCK_GET_NAME ||
92fb71333d5737 Ronak Jain 2024-09-19  671  			    qdata.qid == PM_QID_PINCTRL_GET_FUNCTION_NAME)
92fb71333d5737 Ronak Jain 2024-09-19  672  				i = 1;
92fb71333d5737 Ronak Jain 2024-09-19  673  
92fb71333d5737 Ronak Jain 2024-09-19  674  			for (; i < PAYLOAD_ARG_CNT; i++, out++)
92fb71333d5737 Ronak Jain 2024-09-19  675  				*out = ret_payload[i];
92fb71333d5737 Ronak Jain 2024-09-19  676  
92fb71333d5737 Ronak Jain 2024-09-19 @677  			return ret;

Please just return 0 here.

92fb71333d5737 Ronak Jain 2024-09-19  678  		}
92fb71333d5737 Ronak Jain 2024-09-19  679  	}
f9627312e20721 Rajan Vaja 2018-09-12  680  
92fb71333d5737 Ronak Jain 2024-09-19  681  	ret = zynqmp_pm_invoke_fn(PM_QUERY_DATA, out, 4, qdata.qid,
92fb71333d5737 Ronak Jain 2024-09-19  682  				  qdata.arg1, qdata.arg2, qdata.arg3);
f9627312e20721 Rajan Vaja 2018-09-12  683  
f9627312e20721 Rajan Vaja 2018-09-12  684  	/*
f9627312e20721 Rajan Vaja 2018-09-12  685  	 * For clock name query, all bytes in SMC response are clock name
f9627312e20721 Rajan Vaja 2018-09-12  686  	 * characters and return code is always success. For invalid clocks,
f9627312e20721 Rajan Vaja 2018-09-12  687  	 * clock name bytes would be zeros.
f9627312e20721 Rajan Vaja 2018-09-12  688  	 */
f9627312e20721 Rajan Vaja 2018-09-12  689  	return qdata.qid == PM_QID_CLOCK_GET_NAME ? 0 : ret;
f9627312e20721 Rajan Vaja 2018-09-12  690  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

