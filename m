Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3465C2C8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 08:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714380287; cv=none; b=lXYYm/AZNiGOQf63E1otKLEeEnZUH9GsfDuHVrU9rPWTO4SXl6aNc1xECq0Xex6a9tlAvxgCdQA8uBPTR3e42UG+1Mw0bIAfA1rvAeXQO38+6fW2vPDFheOO4CZyDICrukGK4Wcmvmy61Litx2N60HPwqKLz8nMzGu7ijDWjo3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714380287; c=relaxed/simple;
	bh=wF0kDbdYtUJuWt7K00viF38Od1XcZftI/0Gm7eiFcR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j4PnEVscVbHJ8mj4eKJ+mIFSCOEfxMc60Hih4+HML77gRzmvPo16YrM8nh0Ixk/dmFudnGinYKloqno0bJU0rkjuRuZhTd/9th8Xn3oYuSFppP/FoKKKNbtPRGWa4Z8B4K5mLEPWTxxQdlfO0HSHJAO5TQuPTtiweyFLOCjZaW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rz2M9639; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rz2M9639"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714380284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=so+wJdf4QBXfJtLjFUPAXghc2OBsJOAJaZ0LhApDlUI=;
	b=Rz2M9639M6AgpWsVXwnbXHrdh00Ue0ZkPucXIHJtNYGgxsS1JHqIOeUSNgn20FmgtbB1H7
	nhe36YqKGiDxY4udURzOX8aQlKsYU5gYWh0XBUStflgbSPWtsuog6htKmBEZfPAdY+zMGH
	dw7vdVG8xREwjJaI3s0TKA26lxPxlkA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-2e2M4DgWNVmM0eQCtleqjw-1; Mon, 29 Apr 2024 04:44:43 -0400
X-MC-Unique: 2e2M4DgWNVmM0eQCtleqjw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a55be723396so229243366b.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 01:44:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714380282; x=1714985082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=so+wJdf4QBXfJtLjFUPAXghc2OBsJOAJaZ0LhApDlUI=;
        b=I1yu8dfI0uQmnKVP0wTzH8EoDaAbztXd36hTo46cK7rMXaol2NvAeTZ7NAxuFAAnwq
         k5oo9wDKaMkdSrYoTVvC0/xAStLcldfYIJ9VDg/117RX2vZcSzL3Z3QjXlZTgto4NYqz
         IGdwlCwyopk+j4ZaozPvOYj7QPEoe/lXUoRms0BW1+C3hnec5oizMqrChLynjYEAj7JI
         r+HFqF6ZcKKmHauTgx+nOLw0j6CZCnJzh6eeT9c+QVCG2F4Y5mg+GN0FVs0j5e8+jKP0
         AM9IqyI73wgVNoiN8jEQDSn7GL9pkP5I+zINZrb0j9VtMnkd7ij/5tPx6Zs+1IhNa5fL
         bC/A==
X-Forwarded-Encrypted: i=1; AJvYcCXmNljFhCmP6Yx34nwfkmHg3COgqfOZOjN/ksWsG1xWm7qncl4/kt07eC80RzlvjV5ijyAhFcveqCgT3QcsrF+YUKsEk9kTVWhuu4LgkA==
X-Gm-Message-State: AOJu0Ywjva4mPh9lN6/x9Sdljn73HxRmqCklVAt9JY+Ny+WjcoEIHQID
	NVs8fqPUHRysX/60z7TkDlisRalmg35EiOTvuwalsoPjUl/DXI/4Pj2PIpRbdFHPYEZ6ZlRXCaR
	rz3JugpwFk8H+Gr2VIAuuFnFOPT96EaDoo181Wx9Vq4wcl8keqEB6nlCYShOVCaU=
X-Received: by 2002:a17:906:33cf:b0:a58:bdfa:c2b1 with SMTP id w15-20020a17090633cf00b00a58bdfac2b1mr6562863eja.9.1714380281927;
        Mon, 29 Apr 2024 01:44:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiv24mRwDyD/c73Y2SoNQB96iLq1QRsY4OnJzvjs388PeX7aS5r11050EUxTn4bC4gjvfCDw==
X-Received: by 2002:a17:906:33cf:b0:a58:bdfa:c2b1 with SMTP id w15-20020a17090633cf00b00a58bdfac2b1mr6562851eja.9.1714380281580;
        Mon, 29 Apr 2024 01:44:41 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a7-20020a170906670700b00a522bef9f06sm13610877ejp.181.2024.04.29.01.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 01:44:41 -0700 (PDT)
Message-ID: <5c7952f2-65ee-4b36-acdb-69098bee51e3@redhat.com>
Date: Mon, 29 Apr 2024 10:44:40 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [jic23-iio:testing 6/16] drivers/iio/industrialio-acpi.c:29:
 warning: Function parameter or struct member 'orientation' not described in
 'iio_read_acpi_mount_matrix'
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, jic23@kernel.org
References: <202404290216.Uf6waaF1-lkp@intel.com>
 <20240429094054.000021d3@Huawei.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240429094054.000021d3@Huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/29/24 10:40 AM, Jonathan Cameron wrote:
> On Mon, 29 Apr 2024 02:53:19 +0800
> kernel test robot <lkp@intel.com> wrote:
> 
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
>> head:   383e66c0de06c77c053a899a9cbc4a9f0c9a5f65
>> commit: 600b6de8062fe195d936971170fd9a57b6fcb57e [6/16] iio: core: Add iio_read_acpi_mount_matrix() helper function
>> config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240429/202404290216.Uf6waaF1-lkp@intel.com/config)
>> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404290216.Uf6waaF1-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202404290216.Uf6waaF1-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> drivers/iio/industrialio-acpi.c:29: warning: Function parameter or struct member 'orientation' not described in 'iio_read_acpi_mount_matrix'
>>>> drivers/iio/industrialio-acpi.c:29: warning: Function parameter or struct member 'acpi_method' not described in 'iio_read_acpi_mount_matrix'
>>>> drivers/iio/industrialio-acpi.c:29: warning: Excess function parameter 'matrix' description in 'iio_read_acpi_mount_matrix'
>>>> drivers/iio/industrialio-acpi.c:29: warning: Excess function parameter 'method_name' description in 'iio_read_acpi_mount_matrix'  
>>
>>
>> vim +29 drivers/iio/industrialio-acpi.c
> 
> I'll fix these up when I'm next on the right computer.

Thanks. I did test-build the docs, but I did not notice this my bad.

Regards,

Hans



>>      8	
>>      9	/**
>>     10	 * iio_read_acpi_mount_matrix() - Read accelerometer mount matrix info from ACPI
>>     11	 * @dev:		Device structure
>>     12	 * @matrix: 		iio_mount_matrix struct to fill
>>     13	 * @method_name:	ACPI method name to read the matrix from, usually "ROTM"
>>     14	 *
>>     15	 * Try to read the mount-matrix by calling the specified method on the device's
>>     16	 * ACPI firmware-node. If the device has no ACPI firmware-node; or the method
>>     17	 * does not exist then this will fail silently. This expects the method to
>>     18	 * return data in the ACPI "ROTM" format defined by Microsoft:
>>     19	 * https://learn.microsoft.com/en-us/windows-hardware/drivers/sensors/sensors-acpi-entries
>>     20	 * This is a Microsoft extension and not part of the official ACPI spec.
>>     21	 * The method name is configurable because some dual-accel setups define 2 mount
>>     22	 * matrices in a single ACPI device using separate "ROMK" and "ROMS" methods.
>>     23	 *
>>     24	 * Returns: true if the matrix was successfully, false otherwise.
>>     25	 */
>>     26	bool iio_read_acpi_mount_matrix(struct device *dev,
>>     27					struct iio_mount_matrix *orientation,
>>     28					char *acpi_method)
>>   > 29	{  
>>
> 

