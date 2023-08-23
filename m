Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598E3C139
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 17:41:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59970C433C8;
	Wed, 23 Aug 2023 17:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692812491;
	bh=8/YkxvUodqJ527upFRob3AUp9TczYWqFKqOQZJShlhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UKkqTI5okUK/duxYIhKPEvdcLUFyd/oXFKdl+qJYjBnK1MvAZg67vPyI91yaaz82c
	 WSkMT9W+WQrDjgvVvE12AyHQlbCriWXQE/bxYf+t6BT7S9cXZD/johMFGFrxvA02s3
	 Q29tQ+GODZB79QQd4Ozh4FuoVrlEVI90Nln9lSSwGE7uF10+Xme5f0aU/KbyBg7Lyx
	 STTwrZFXo4BpH9yJqMTbD95SPPYtCndjWYm02WklV9bA5y1wdW57dmhebYrxSDG97W
	 2uSsCynRgTtXXdchQD4XjF18erlCfpAGvcTNeZKnabHi1AuuU26S08UiDnhIRw+Z9Q
	 Fsbfp4baIGeiA==
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Aug 2023 20:41:29 +0300
Message-Id: <CV03Y1UQZTON.21AZAH4SXCQS3@suppilovahvero>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "kernel test robot" <lkp@intel.com>
Cc: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [jarkko-tpmdd:tpm_buf 24/25] drivers/char/tpm/tpm-buf.c:176:16:
 sparse: sparse: cast to restricted __be16
X-Mailer: aerc 0.14.0
References: <202308232048.CHgYYDuz-lkp@intel.com>
In-Reply-To: <202308232048.CHgYYDuz-lkp@intel.com>

On Wed Aug 23, 2023 at 3:19 PM EEST, kernel test robot wrote:
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.=
git tpm_buf
> head:   a1d8288229c7c1acfe0b2acf8107eaad8f49e070
> commit: 9976c4e1af56380aaa5ac3eb3b717176d70bd2b3 [24/25] tpm: Add tpm_buf=
_read_{u8,u16,u32}
> config: sh-randconfig-r122-20230823 (https://download.01.org/0day-ci/arch=
ive/20230823/202308232048.CHgYYDuz-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 13.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230823/202308232048=
.CHgYYDuz-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308232048.CHgYYDuz-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> drivers/char/tpm/tpm-buf.c:176:16: sparse: sparse: cast to restricted =
__be16
> >> drivers/char/tpm/tpm-buf.c:176:16: sparse: sparse: cast to restricted =
__be16
> >> drivers/char/tpm/tpm-buf.c:176:16: sparse: sparse: cast to restricted =
__be16
> >> drivers/char/tpm/tpm-buf.c:176:16: sparse: sparse: cast to restricted =
__be16
> >> drivers/char/tpm/tpm-buf.c:193:16: sparse: sparse: cast to restricted =
__be32
> >> drivers/char/tpm/tpm-buf.c:193:16: sparse: sparse: cast to restricted =
__be32
> >> drivers/char/tpm/tpm-buf.c:193:16: sparse: sparse: cast to restricted =
__be32
> >> drivers/char/tpm/tpm-buf.c:193:16: sparse: sparse: cast to restricted =
__be32
> >> drivers/char/tpm/tpm-buf.c:193:16: sparse: sparse: cast to restricted =
__be32
> >> drivers/char/tpm/tpm-buf.c:193:16: sparse: sparse: cast to restricted =
__be32
>
> vim +176 drivers/char/tpm/tpm-buf.c
>
>    162=09
>    163	/**
>    164	 * tpm_buf_read_u16() - Read 16-bit word from a TPM buffer
>    165	 * @buf:	&tpm_buf instance
>    166	 * @offset:	offset within the buffer
>    167	 *
>    168	 * Return: next 16-bit word
>    169	 */
>    170	u16 tpm_buf_read_u16(const struct tpm_buf *buf, off_t *offset)
>    171	{
>    172		u16 value;
>    173=09
>    174		tpm_buf_read(buf, offset, sizeof(value), &value);
>    175=09
>  > 176		return be16_to_cpu(value);
>    177	}
>    178	EXPORT_SYMBOL_GPL(tpm_buf_read_u16);
>    179=09
>    180	/**
>    181	 * tpm_buf_read_u32() - Read 32-bit word from a TPM buffer
>    182	 * @buf:	&tpm_buf instance
>    183	 * @offset:	offset within the buffer
>    184	 *
>    185	 * Return: next 32-bit word
>    186	 */
>    187	u32 tpm_buf_read_u32(const struct tpm_buf *buf, off_t *offset)
>    188	{
>    189		u32 value;
>    190=09
>    191		tpm_buf_read(buf, offset, sizeof(value), &value);
>    192=09
>  > 193		return be32_to_cpu(value);
>
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Right, I can fix these for the next iteration, which will be v3.

BR, Jarkko
