Content-Type: multipart/mixed; boundary="===============1474350838597281470=="
MIME-Version: 1.0
From: Marc Zyngier <maz@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 2/2] KVM: arm64: Mark the host stage-2 memory pools static
Date: Fri, 14 May 2021 11:12:03 +0100
Message-ID: <8036c2e2e6c87849072d4189f9d2319a@kernel.org>
In-Reply-To: <20210514100941.GA3795@willie-the-truck>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1474350838597281470==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2021-05-14 11:09, Will Deacon wrote:
> On Fri, May 14, 2021 at 08:56:40AM +0000, Quentin Perret wrote:
>> The host stage-2 memory pools are not used outside of mem_protect.c,
>> mark them static.
>> =

>> Fixes: 1025c8c0c6ac ("KVM: arm64: Wrap the host with a stage 2")
>> Reported-by: Reported-by: kernel test robot <lkp@intel.com>
> =

> ^^^ nit, but this tag has gone wonky.

Well spotted. I'll fix it locally, though the SHA1 will change...

         M.
-- =

Jazz is not dead. It just smells funny...
--===============1474350838597281470==--

