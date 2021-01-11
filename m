Content-Type: multipart/mixed; boundary="===============7679197871461767784=="
MIME-Version: 1.0
From: Kalle Valo <kvalo@codeaurora.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 06/13] wcn36xx: Add ipv6 namespace offload in suspend
Date: Mon, 11 Jan 2021 13:27:03 +0200
Message-ID: <878s8zlnnc.fsf@codeaurora.org>
In-Reply-To: <bcf6adbc-e03a-6f02-e55f-6e0b738806fd@linaro.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7679197871461767784==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Bryan O'Donoghue <bryan.odonoghue@linaro.org> writes:

> On 28/12/2020 21:49, kernel test robot wrote:
>> [auto build test ERROR on wireless-drivers-next/master]
>
> hmm
>
> works against this
>
> * 77da2c99eca0 - (tag: ath-202012180905, ath.git/master) Add
> localversion-wireless-testing-ath (11 days ago)

The bot tested only ath-next from ath.git, not the master branch:

[auto build test ERROR on wireless-drivers-next/master]
[also build test ERROR on wireless-drivers/master ath6kl/ath-next v5.11-rc1=
 next-20201223]

I'm guessing that this build error is due to some API changes in
net-next. I'm planning to update ath.git tree today to v5.11, hopefully
that clears up the issue.

-- =

https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes
--===============7679197871461767784==--

