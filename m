Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EC318B484
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Nov 2024 21:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731618414; cv=none; b=IZWGMuE8z4MwGs38XA6NPvjlwzgYd5UDvp3XCUyvZ3mFkkkHpj/8wzxdIRLuFi30rVKeuSf/bZuZfd/bd7L4BAuSL/0npT9KurZZLz5A1Cz9JkKotUFB6gRMju3EmIHt0FWomCjh6VpMzp6dsOaVs0PCSqVlvhoaeJwRU5sQVxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731618414; c=relaxed/simple;
	bh=OIMyWHIV5vQ44npShwIoy0X2Nh4iLVXmCIFiLxa5iKM=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=VWZed5Eb41YtNMOm6oUwrVYGydC5W5JGI4LrcxOB5Sx1eXOObPvf/32eNEu7gV2lDU/3RW3hraJubbj3rrVtNJdlKv7tTXynIyYUIg79aO+idpWrr02s3szXYGFWGSwgnWWbDzqKIrFZKgAzPAY3Mnr5wuNSmiCQ41hEDZ7fIjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lUuHpjqc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lUuHpjqc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D939C4CECD;
	Thu, 14 Nov 2024 21:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731618413;
	bh=OIMyWHIV5vQ44npShwIoy0X2Nh4iLVXmCIFiLxa5iKM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=lUuHpjqcu+bRv0jlBhCi5nVxqnnFkWfQDeck8QN8s2iavOUSEWLVdquWt2JC/q7uI
	 muzuKfHujC9vhrkHV8nGSZ7tXIymoi9l+NwqlJdxa2sxlXnXt09fdxm0bn5XEh3Nsx
	 tsFi8CxV+Zs3lgpql2LoppjT69XDIuxBrrUgGIfF6pN7B/kgbfl/Oz6QFwEKM+NrO6
	 3oKWFKnFwXKnMnlPu964DmQXPi14hW196oF+t66MHbHTHE8XIAg4AGbd89RQLxYY7t
	 IcIgDMsXSI4f8099/7rGs08hcC71CgI3/JZyyCYjPJojKN9wdNaA1yXy6NffZ7cfWT
	 vrWtq1i+QDoCQ==
Message-ID: <16314bdd5856de924ac98244638cd001.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <202411090953.6qxjUlHH-lkp@intel.com>
References: <202411090953.6qxjUlHH-lkp@intel.com>
Subject: Re: [robh:for-kernelci 32/35] make[5]: *** No rule to make target 'drivers/of/kunit_overlay_test.dtbo.o', needed by 'drivers/of/built-in.a'.
From: Stephen Boyd <sboyd@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
To: kernel test robot <lkp@intel.com>, Rob Herring (Arm) <robh@kernel.org>
Date: Thu, 14 Nov 2024 13:06:51 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting kernel test robot (2024-11-08 17:47:38)
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git fo=
r-kernelci
> head:   07900b9108a8ef999f7a015d6bd766b9885ca593
> commit: 027af8c26fdc064260a08c0d6dac64d5dc2c25d4 [32/35] of: Allow overla=
y kunit tests to run CONFIG_OF_OVERLAY=3Dn
> config: sparc64-randconfig-r132-20241108 (https://download.01.org/0day-ci=
/archive/20241109/202411090953.6qxjUlHH-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 14.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20241109/202411090953=
.6qxjUlHH-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411090953.6qxjUlHH-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
> >> make[5]: *** No rule to make target 'drivers/of/kunit_overlay_test.dtb=
o.o', needed by 'drivers/of/built-in.a'.
>    make[5]: Target 'drivers/of/' not remade because of errors.
>=20

Oh fun. The 'select OF_OVERLAY' was hiding 'select DTC'. Commit
027af8c26fdc ("of: Allow overlay kunit tests to run
CONFIG_OF_OVERLAY=3Dn") needs to get this folded in.

----8<----
diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index 0efa2d1b687a..f0b8cc23c46d 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -111,6 +111,7 @@ config OF_OVERLAY_KUNIT_TEST
 	tristate "Device Tree overlay KUnit tests" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+	select DTC
 	help
 	  This option builds KUnit unit tests for the device tree overlay code.
