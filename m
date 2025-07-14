Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F69265288
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Jul 2025 19:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752520158; cv=none; b=m2vdzsBwU3JI7weA2kkbXRbJvASvFxKQRd8VvkOrJ7rxAracQ7uN6j+B6c5S9PMUDme6I0XlDbf042vRAZDC11hcxkKVw0cjWyyY9j3mG8gzBrrTLXkZSzkyaaPdt3N7T1/VRy/qM77he+rXaSOPpOG6+9BvBGVDTy892GVMBPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752520158; c=relaxed/simple;
	bh=8kiBgOfS/fjKdg8vDlK6T1LtEN52TFTEPzqINcbTJeA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=sXWXQuIoGJ2OroPuoVMQp8Bs6lao6l0WArWqh433MUtX6Ee0/YIy0uvIqYlFJJVB1MxcfItNm21u6ZNZsRq+UD4VG5KrxOwy4x5yyQSo2bdV9vcGZj4LdQRHBJlKhW/mZwdxYaTzO6QduAiVoQoQAH2hOdqkUTqI/FiP5Kgtwjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RxU4n8ct; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RxU4n8ct"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-41b309ce799so350061b6e.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Jul 2025 12:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752520156; x=1753124956; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B3SgGLKf5Lr2dZOluWT5bcYGf7tZp5eJXTusKMbFBy0=;
        b=RxU4n8ctGEkwtyqt90S3gvLHEG5cRFcIi6fAj3gM+UM+ZYJiB2zNV7LciTfd2+yccR
         NUeee680/UvT0UpjJV+tryHGiILICW4GljTTn4Nv6SSuNHfcF6bjYG6sMcgOyWu83OOm
         wSNrobY/sxlIbX31BAujX1stYR/Da+1SHEvpoFCo5DYlRzjawGCsFPShK+O+I8vvBcdl
         x50x1yY6wJVgHPZtmrtBHYZKokWG0c2ofbtyM7vd0sZsKc91XZ7+xX7RMZCoOFJQ7l69
         UsWP1QIMKLHGtqQ7T57CKP9kQFcX8jlPlall409KlADlnvwTHk5omettD+gTW2JOzzsU
         EnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752520156; x=1753124956;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B3SgGLKf5Lr2dZOluWT5bcYGf7tZp5eJXTusKMbFBy0=;
        b=tAQq0kVDr72u8ImwEvghssuDW2RKVBYfQ++uzPxM0AKvpyS5ixA8T7ksw+NnBKj5oL
         r5bCvUPajjDUsAh8LScWGisMlZukhz0/YvLXztnRlwMcBopRXYBPPIRxcDeqsTzQDVwa
         TXHkRthrVdGVYP79hlRzbkqk7YrErPfZ398NIssnIZoLQm5rzm9nxor08I8WnswGknS1
         Sus78MvpzyatvJVPH7FCdSh0jZuvK+G5ajf2lyZn61DJJXnIlS0BU5QBAuR2BmTuWwvt
         wKYQ4I/TQg+FCIZARQdiHTz6ezcArlpDF8vkW59j9j4KWd9iBTd/BCeG29DmIzPfihyb
         BgEw==
X-Forwarded-Encrypted: i=1; AJvYcCXXWm1bsXu1R0g/4/5i55TiTqArwOWaklRlTnl9qC9cnxzAGe+5z35Z89/JZIIcfagbMp5LDiz7RbY0A9ah@lists.linux.dev
X-Gm-Message-State: AOJu0YzQUtFZmMaiQtcZIEPd2aLEPTxJl2IVVv3MG0aN5hJyjtAl2tSd
	ixQMD6wLdFFMfmOyY7VJkI2Zh43AfCSWMwKBsuDV08pNZ9hcSNCSWSDm/kKl4D7tkQnnp3YQtIv
	W1b+U
X-Gm-Gg: ASbGncuEiq6haagylJJJaL5dzToy0a5zkQBmPAr0c8rpnteGXWe7tj5FhOcKOPYD1Lr
	AApycroU9tXTCOEREVawcoy4Qm/kb601RhFbKooFtmehxu29gCDAzF85LbfLV4WQ4NgTviaKI71
	At6s0I/pheKBN6OOTW5euIrMOChlgg/Uv6mtGth7xsbu0KiBM1Y0XbRyRWXudZKxRHFoSpaLBHW
	zrUyRREfQS7wVurADctWThiUNyl8Xg1N5wZL38/I6EBmeSzNh+vOL10bgOxmmfaktwyiqsQo12L
	SWxMI+xMLovtYqDq8SJGL4u4qxKhtAL5QyNu79Rox5B9Rd0oMPBIx1tGUKRjuvy59ibEjr1JAUa
	XiFvG/x6oAwxFqlg6Y+NmtPxxOZTYYg==
X-Google-Smtp-Source: AGHT+IF6LmPkGbNsTbQK3ZRrgJftx0aP81gIu3669/dmq3KVoDnmgZ1iXZ7Ix3ulzzkg5rVzL89ZSA==
X-Received: by 2002:a05:6808:6ec5:b0:40c:f806:d604 with SMTP id 5614622812f47-415396c0082mr11386472b6e.19.1752520156052;
        Mon, 14 Jul 2025 12:09:16 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6bb2:d90f:e5da:befc])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-414191e562bsm1594083b6e.12.2025.07.14.12.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 12:09:15 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:09:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jarkko Sakkinen <jarkko@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5] tpm: Managed allocations for tpm_buf instances
Message-ID: <a44027cd-7465-434f-93fc-b3fac29599b2@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703181712.923302-1-jarkko@kernel.org>

Hi Jarkko,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jarkko-Sakkinen/tpm-Managed-allocations-for-tpm_buf-instances/20250704-021800
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20250703181712.923302-1-jarkko%40kernel.org
patch subject: [PATCH v5] tpm: Managed allocations for tpm_buf instances
config: i386-randconfig-141-20250704 (https://download.01.org/0day-ci/archive/20250706/202507062112.JKYfCa34-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507062112.JKYfCa34-lkp@intel.com/

smatch warnings:
drivers/char/tpm/tpm2-cmd.c:211 tpm2_pcr_read() warn: missing error code? 'rc'

vim +/rc +211 drivers/char/tpm/tpm2-cmd.c

879b589210a9a0 Roberto Sassu   2019-02-06  165  int tpm2_pcr_read(struct tpm_chip *chip, u32 pcr_idx,
879b589210a9a0 Roberto Sassu   2019-02-06  166  		  struct tpm_digest *digest, u16 *digest_size_ptr)
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  167  {
879b589210a9a0 Roberto Sassu   2019-02-06  168  	int i;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  169  	int rc;
91f7f3d773a469 Roberto Sassu   2017-06-23  170  	struct tpm2_pcr_read_out *out;
91f7f3d773a469 Roberto Sassu   2017-06-23  171  	u8 pcr_select[TPM2_PCR_SELECT_MIN] = {0};
879b589210a9a0 Roberto Sassu   2019-02-06  172  	u16 digest_size;
879b589210a9a0 Roberto Sassu   2019-02-06  173  	u16 expected_digest_size = 0;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  174  
a5dbe6d43b61d5 Jarkko Sakkinen 2025-07-03  175  	struct tpm_buf *buf __free(kfree) = tpm_buf_alloc();
a5dbe6d43b61d5 Jarkko Sakkinen 2025-07-03  176  	if (!buf)
a5dbe6d43b61d5 Jarkko Sakkinen 2025-07-03  177  		return -ENOMEM;
a5dbe6d43b61d5 Jarkko Sakkinen 2025-07-03  178  
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  179  	if (pcr_idx >= TPM2_PLATFORM_PCR)
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  180  		return -EINVAL;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  181  
879b589210a9a0 Roberto Sassu   2019-02-06  182  	if (!digest_size_ptr) {
879b589210a9a0 Roberto Sassu   2019-02-06  183  		for (i = 0; i < chip->nr_allocated_banks &&
879b589210a9a0 Roberto Sassu   2019-02-06  184  		     chip->allocated_banks[i].alg_id != digest->alg_id; i++)
879b589210a9a0 Roberto Sassu   2019-02-06  185  			;
879b589210a9a0 Roberto Sassu   2019-02-06  186  
879b589210a9a0 Roberto Sassu   2019-02-06  187  		if (i == chip->nr_allocated_banks)
879b589210a9a0 Roberto Sassu   2019-02-06  188  			return -EINVAL;
879b589210a9a0 Roberto Sassu   2019-02-06  189  
879b589210a9a0 Roberto Sassu   2019-02-06  190  		expected_digest_size = chip->allocated_banks[i].digest_size;
879b589210a9a0 Roberto Sassu   2019-02-06  191  	}
879b589210a9a0 Roberto Sassu   2019-02-06  192  
a5dbe6d43b61d5 Jarkko Sakkinen 2025-07-03  193  	tpm_buf_reset(buf, TPM2_ST_NO_SESSIONS, TPM2_CC_PCR_READ);
91f7f3d773a469 Roberto Sassu   2017-06-23  194  
91f7f3d773a469 Roberto Sassu   2017-06-23  195  	pcr_select[pcr_idx >> 3] = 1 << (pcr_idx & 0x7);
91f7f3d773a469 Roberto Sassu   2017-06-23  196  
a5dbe6d43b61d5 Jarkko Sakkinen 2025-07-03  197  	tpm_buf_append_u32(buf, 1);
a5dbe6d43b61d5 Jarkko Sakkinen 2025-07-03  198  	tpm_buf_append_u16(buf, digest->alg_id);
a5dbe6d43b61d5 Jarkko Sakkinen 2025-07-03  199  	tpm_buf_append_u8(buf, TPM2_PCR_SELECT_MIN);
a5dbe6d43b61d5 Jarkko Sakkinen 2025-07-03  200  	tpm_buf_append(buf, (const unsigned char *)pcr_select,
91f7f3d773a469 Roberto Sassu   2017-06-23  201  		       sizeof(pcr_select));
91f7f3d773a469 Roberto Sassu   2017-06-23  202  
a5dbe6d43b61d5 Jarkko Sakkinen 2025-07-03  203  	rc = tpm_transmit_cmd(chip, buf, 0, "attempting to read a pcr value");
879b589210a9a0 Roberto Sassu   2019-02-06  204  	if (rc)
a5dbe6d43b61d5 Jarkko Sakkinen 2025-07-03  205  		return rc;
879b589210a9a0 Roberto Sassu   2019-02-06  206  
a5dbe6d43b61d5 Jarkko Sakkinen 2025-07-03  207  	out = (struct tpm2_pcr_read_out *)&buf->data[TPM_HEADER_SIZE];
879b589210a9a0 Roberto Sassu   2019-02-06  208  	digest_size = be16_to_cpu(out->digest_size);
879b589210a9a0 Roberto Sassu   2019-02-06  209  	if (digest_size > sizeof(digest->digest) ||
a5dbe6d43b61d5 Jarkko Sakkinen 2025-07-03  210  	    (!digest_size_ptr && digest_size != expected_digest_size))
a5dbe6d43b61d5 Jarkko Sakkinen 2025-07-03 @211  		return rc;

return -EINVAL?

7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  212  
879b589210a9a0 Roberto Sassu   2019-02-06  213  	if (digest_size_ptr)
879b589210a9a0 Roberto Sassu   2019-02-06  214  		*digest_size_ptr = digest_size;
879b589210a9a0 Roberto Sassu   2019-02-06  215  
879b589210a9a0 Roberto Sassu   2019-02-06  216  	memcpy(digest->digest, out->digest, digest_size);
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  217  	return rc;

return 0; pls

7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  218  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

