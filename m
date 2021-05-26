Content-Type: multipart/mixed; boundary="===============8354455033075202889=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2 4/4] slub: Force on no_hash_pointers when slub_debug is enabled
Date: Wed, 26 May 2021 13:40:43 +0800
Message-ID: <202105261354.dnH8ijYS-lkp@intel.com>
In-Reply-To: <20210526025625.601023-5-swboyd@chromium.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8354455033075202889==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

I love your patch! Perhaps something to improve:

[auto build test WARNING on d07f6ca923ea0927a1024dfccafc5b53b61cfecc]

url:    https://github.com/0day-ci/linux/commits/Stephen-Boyd/slub-Print-no=
n-hashed-pointers-in-slub-debugging/20210526-105816
base:   d07f6ca923ea0927a1024dfccafc5b53b61cfecc
config: i386-tinyconfig (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=3D1 build):
        # https://github.com/0day-ci/linux/commit/1e3e0117436276faacd0217d8=
9715df61021b4d2
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Stephen-Boyd/slub-Print-non-hashed=
-pointers-in-slub-debugging/20210526-105816
        git checkout 1e3e0117436276faacd0217d89715df61021b4d2
        # save the attached .config to linux build tree
        make W=3D1 ARCH=3Di386 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1663:2: warning: function 'va_format' might be a candidat=
e for 'gnu_printf' format attribute [-Wsuggest-attribute=3Dformat]
    1663 |  buf +=3D vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt,=
 va);
         |  ^~~
   lib/vsprintf.c: At top level:
>> lib/vsprintf.c:2189:12: warning: no previous prototype for 'no_hash_poin=
ters_enable' [-Wmissing-prototypes]
    2189 | int __init no_hash_pointers_enable(char *str)
         |            ^~~~~~~~~~~~~~~~~~~~~~~


vim +/no_hash_pointers_enable +2189 lib/vsprintf.c

  2188	=

> 2189	int __init no_hash_pointers_enable(char *str)
  2190	{
  2191		if (no_hash_pointers)
  2192			return 0;
  2193	=

  2194		no_hash_pointers =3D true;
  2195	=

  2196		pr_warn("**********************************************************=
\n");
  2197		pr_warn("**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **=
\n");
  2198		pr_warn("**                                                      **=
\n");
  2199		pr_warn("** This system shows unhashed kernel memory addresses   **=
\n");
  2200		pr_warn("** via the console, logs, and other interfaces. This    **=
\n");
  2201		pr_warn("** might reduce the security of your system.            **=
\n");
  2202		pr_warn("**                                                      **=
\n");
  2203		pr_warn("** If you see this message and you are not debugging    **=
\n");
  2204		pr_warn("** the kernel, report this immediately to your system   **=
\n");
  2205		pr_warn("** administrator!                                       **=
\n");
  2206		pr_warn("**                                                      **=
\n");
  2207		pr_warn("**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **=
\n");
  2208		pr_warn("**********************************************************=
\n");
  2209	=

  2210		return 0;
  2211	}
  2212	early_param("no_hash_pointers", no_hash_pointers_enable);
  2213	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8354455033075202889==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICGjarWAAAy5jb25maWcAlFxZk9u2sn7Pr2AlVbeSBzuzeObYdWseIBCUEHEzQWqZF5ai4diq
zEhztCT2v7/dACmCZEPxPVUnttGNvdH99UL98tMvHjsdd6+r42a9enn57n2pttV+dayevOfNS/W/
np94cZJ7wpf5e2AON9vTt983tx/vvbv317fvr97t1zfetNpvqxeP77bPmy8n6L7ZbX/65SeexIEc
l5yXM5EpmcRlLhb5w89f1ut3n7xf/erPzWrrfXqPw9zc/Gb+9rPVTapyzPnD96Zp3A718Onq9urq
zBuyeHwmnZuZ0kPERTsENDVsN7d3VzdNe+gj6yjwW1ZoolktwpW1Ws7iMpTxtB3BaixVznLJO7QJ
LIapqBwneUISZAxdRUuS2edynmTWDKNChn4uI1HmbBSKUiVZ3lLzSSYYbCwOEvgPsCjsCjfzizfW
9/ziHarj6a29q1GWTEVcwlWpKLUmjmVeinhWsgz2LyOZP9zewCjNkpMolTB7LlTubQ7ednfEgc8H
lnAWNif2889tP5tQsiJPiM56h6ViYY5d68YJm4lyKrJYhOX4UVortSkjoNzQpPAxYjRl8ejqkbgI
H2jCo8pRms67tdZr77NP16u+xIBrJw7KXv+wS3J5xA+XyLgRYkJfBKwIcy0c1t00zZNE5TGLxMPP
v2532+o3697VUs1kysk55yznk/JzIQpB0nmWKFVGIkqyZcnynPEJyVcoEcoRsWx9RSyDSVgBWg3W
AkIYNu8Cnph3OP15+H44Vq/tuxiLWGSS6xeYZsnIepQ2SU2SuS0MmQ+tqlTzMhNKxD7dC2nZDNQD
vIIo8XsPPkgyLvz6Lct43FJVyjIlkElfebV98nbPvR20GjLhU5UUMJY5Yj+xRtLHYbPoO/1OdZ6x
UPosF2XIVF7yJQ+Js9AaadYebY+sxxMzEefqIrGMQGsx/49C5QRflKiySHEtvfeXJkouSp4Weh2Z
0oqvUZz6lvPNa7U/UBc9eSxTGD7xta4+S1OcIEX6IS2UmkxSJnI8wQuul9LlqW9ssJpmMWkmRJTm
MLy2AudBm/ZZEhZxzrIlOXXNZdP05uFgfs9Xh7+8I8zrrWANh+PqePBW6/XutD1utl/a4wCTNdUn
yThPYC4jf+cpUD71XbdkeilKkjv/gaXoJWe88NTwsmC+ZQk0e0nwz1Is4A4pS6QMs91dNf3rJXWn
srY6NX9xaZQiVrUJ5hN4rlqKG3FT66/V0+ml2nvP1ep42lcH3VzPSFA773LO4rwc4ZuFcYs4YmmZ
h6MyCAs1sXfOx1lSpIrWmhPBp2kiYSQQxjzJaDk2a0dLrMcieTIRMlrgRuEUtP9MK4/Mp1mSBJTG
4CDbdfIySUGi5KNAxYdvEf6IWMwFcfB9bgV/6eC3JEsnAMDmLIt7OqKQ/vW9pUpBVeUhCA4XqdbD
ecb4QK9wlU5hTSHLcVEt1cibfRcRWEAJJiijj3ks8gh1Uq0haaalCtRFjgD25tJIRgdSSuesHUAY
pvQlFY5X3N0/3ZeBRQoK14oL8ABIikgT1znIcczCgJYnvUEHTdsQB01NAEGQFCZpqCSTsshc+o35
Mwn7ri+LPnCYcMSyTDpkYoodlxHdd5QGFyUBJU2jroACalqLoE/RLgFGi8GEgh7ooEUeOd68Ep+J
gWE44fvC778TWEx5Nu+W+FxfdXCmVoK175hW++fd/nW1XVee+LvaghFgoB45mgEwjq3OdwzuC5Ba
Q4TDKGcRHFXSQ5i1vv3BGduxZ5GZsNQ2zvWg0AlioKgz+lGpkI0chIKCqSpMRvYGsT9cYDYWDcJ2
CHYRBGCFUgaM+gwYaHuHBkgCGQ5Euj6lroPYrGrx8b68tXwq+LftJao8K7jWn77ggGSzlpgUeVrk
pdbm4C5UL8+3N+8wkHB2HNBi+iItVZGmHTcWDCufaoU8pEVR0YOxERrILPbLkTQI8uHjJTpbPFzf
0wzNjf7LOB22znBnkK9Y6dsOpxmALRu7UgY+JxAuQO1RhljbR5vb644PGpEZ2uMFQYO7BVkt0zHc
c957oUrkRYqvxWA78CxahlgABGhI+oXDUBli/UlhBzc6fFrcSDazHjkCV9J4OGCZlBzZXoNmUYVK
wUNykTUI0gfDwnJSgAENR4MRtGygU4AemuVaBGAKBcvCJUcPS1iWOx0b0BbCAw/VwznGUwdhFIuF
ET88RMHhKTWYLt3v1tXhsNt7x+9vBrt2wF090CNAd7x7+rE61C2+skCwvMhEiS40rXDGSegHUtHu
byZysKgyptEBTmBkB2BPRtsU5BGLHO4E7/mSzTdKAZwBSS/UoMokkvD8M9hOqYGoww5OliBTYE0B
zo2LXjyptaUfPt4rGkggiSbcXSDkio5GIC2KFoR+ju616ms5QXoB8kVS0gOdyZfp9Ak3VDpME00d
G5v+x9H+kW7nWaESWmIiEQSSiySmqXMZ84lMuWMhNfmWBmMRaDDHuGMBVmS8uL5ALUOHIPBlJhfO
855Jxm9LOtCmiY6zQ8zk6AWW1v1AaqVOSBJS9XuIcTecwWsBMy6D/OHOZgmv3TSEPCmoKOPnqSLq
WOgSpLvbADhvwSfj+w/95mTWbQGzJ6Mi0soiYJEMlw/3Nl3DLvCcImWZeslAG6D+KoHSjVskXCh8
2kqEoE0plw4mAkWuD8SKHDXN+k47CKShsMgfNk6W4yQmRoHXxIpsSACQEatI5Iycoog42f44YclC
xvZOJ6nIjXNCCoQfSWLvsbalqoRFgDUdiTGMeU0TMZY4INW4cECAho4o4mmlklZ4+tK7zrYxdxZa
ft1tN8fd3gSK2sttgTleBij5eX/3NbR0jNVdRCjGjC8Bezu0tn41SRrif4TDMOUJvJURbXvlRxqn
47iZwDgFoAZXOCWSHEQZnqv7DBV987XllZSfFicYLTT4pBNAhKYPtONZU+8/UHGpWaTSEIzubSdm
17Zi8IQctWG5oSdtyf86wjW1Lg0WkyAAFPpw9Y1fmf91zyhlVMBH47wAsAjsGd4AI2Ckjom7yVrv
NOkDDLZbSkaGKHRhA08w1F2Ih97CtIYFsJ8odJ+zQoeLHFrdBPbBQiXzh/sPlvjkGS0deo3wwv0L
hkSB3+EkAsBIL5iYEEzBQm8bz9+WCoqDtskEZz9114rnY3l9dUWFTB/Lm7urjpw/lrdd1t4o9DAP
MIwVwBALQZnYdLJUEtwpxPIZCt11X+bAi0JXGUXmUn/wyMYx9L/pda99wJmv6IPgkY9gHOOfNNqG
c5TBsgz9nA70NKrzgtfRdS4nKUo5+qjG50F5Pz8Jo9J3/1R7D9Tw6kv1Wm2PejTGU+nt3jCD3/Fj
aveMDiRErqd6dslwWPu29TREYsIL9tV/T9V2/d07rFcvPROjUUjWDUXZuQSi93lg+fRS9cca5nOs
sUyH88H/62HpwUenQ9Pg/Zpy6VXH9fvf7HkxFjAqFHFidZQAbXMnx6IcziNHKSRJSehIroL40mA5
Fvnd3RUNs7XSWapgRB6VY8fmNDbb1f67J15PL6tGoroPRsOpdqwBfzdpC/gaoykJSHUjxMFm//rP
al95/n7ztwkUtgFgn5bXQGbRnIFvbR6Iw7lOxqE4sw5kNa++7FfeczP7k57dzuo4GBryYN3dCoJZ
BwPMZJYXcHePzGFssF5ktri7tsApRi8m7LqMZb/t5u6+35qnDFyIfm3Iar/+ujlWa1Qv756qN1g6
Sn6rHZqzquNVAP2ypb3uP4ooLUM2Eo7Ivi6JwTBXiIY5cJSP6BPR7qfEIGwRayWMeSqO3kTPwqMr
hDUjuYzLkZqzfm2IBP8NtSIRFZv240amFUMpFAGwD93BtKLeDag0UlDEJkYqsgxcIRn/IfS/e2xx
JHsten96xEmSTHtE1Bzw71yOi6Qg0uoKrgL1XV1IQAUMQVOjDTKJfoIB8FptSRxEX2YaXQ0O3azc
VCOZGHE5n0jAENLO7J8DfeDKLGOGb11n7k2PHt/tzQjwJaCYsn+NWDkF5rSuK+rfTibG8Fhi34T1
ahmqdW6HT4nProvDKihnx8m8HMFGTba1R4vkAuS2JSu9nH5qEkAjxu+KLAaXAK5E2nH0foaFkBOs
O8FgOvh5vjBRS92DGoSYv0miZPUR+UVE3mf7ui9TdYQ6l7OhSBkpLxULRBOS6A1Vt5pKMQfNTwpH
vFimvDQ1Mk31GbFQJTgaowukOpTeycYYiktbmd54eiFcdT/43o8n2wrRohCDh3nSFIMMppvLfAI6
z9yZjrP2L5ao1ujLZ4L3X/QTeqY56jc3+ihGpwtVM8bl0bmj7gJpOAZaoKy/AXiujfsmOAi8Fa4C
UhGCNkW9DjYChal/nkmQ49bgYSbz+gAIBaU7a9eqUyXQ7qSTGOoxiAUoG1JzdnudU0Q8xMD/CJYC
8MG3hkuwmlGOazx9OyCwxhb0fQuj8PD+LkrdeYvl1IhC7WjbJTI0C5VXHGj5HGxJ3hQGZnMr8XSB
1O9u7rTL0+4ghSu+vWk8sq4Kt1PZgDd4tkwHua0WVfQVW102VRsXSkpdNSNdb6ZONoOk6wzrIASB
kQ+wETq8ahAVT2bv/lwdqifvL5N9ftvvnjcvnVqr896Qu87O6hyuDZEvjdTZLNZKp2ExlrHq9P8x
bNcMpcs5FCbT7SBi/SaprEj9WnM4alDaCdggW/JGaJYo10cXOsPJgQIrYmSqqxq7dI0fDP0Sjew7
zwBvuDrbxG7vnhtrPBDwCQjUqWtWfb0JXS/pZsnmFANefYxKDIxVyFIYBgtL/AxhBmhYGpI1ZRzl
SAT4B9rtbg2pxavjCrBZGFycE5niW7U+HVd/vlS65N/Todljx5EayTiIctSgdHWKISueSUc4sOaI
pCPNhjtAmEF6mK4F6hVG1esOXMaodcwH7snFmF8TTIxYXLBOsqKNJBoaIbZ15+5opU7jmH4WqmiH
638JYLAlVtOOi04HVCNprmVSh/E/9GwC73uDbUQGI6yZQKHt1XdYHmUJYGJUdKpopooK5TQV3drU
mZJcP3v4cPXp3gq1EzCACnHbRQPTjpPLASrFOsPliKDRYZDH1BVSexwVtP//qIbVQX1XFqsFGl+R
eEsmE2eUloETdh5EJ4bgltUgbDDGJBO6uduqejp4x533dfV35RmDEigQeZTzJ8IopLkw6MjGwVO8
kQYbnx+M+010Aj5OVxurzf7Q9d96zX7192ZtB1g6zFIxe/eiF67q2F/eCWxhsIgUXs5Zt3y0jUps
1vU6vGQYoyxMldZEhKkr7yZmeZQGjjKFHHARQ9zmKJcyw5+jR/rLlMEyz4Gdl93qqQ4JNdphDnfF
fEdWrN/RjtqFyVxX1tJ68rw5FCI/A0/LtXvNIGaZo6LEMKB81sOADkHsf+Gh6PqhIk8cH0UgeVaE
WLYzkqDPpBiikeGdnkOpT1r0OpccTWQ/ftqJRTZdrFBerBxZvJzWD0lAbNiAfTme5OeiLVB3dTGa
pXh100Aq4hnAdnV6e9vtj3aUsNNuDNrmsKb2DdceLRGbkEsGKBwmCuuFMOMkueOCFbiFdIwXCwEX
pfID4bDQN+S+hICLj7yDtbNmRZpSfrrli3vysnpd66jqt9XBk9vDcX961SWZh6/wJJ684361PSCf
B0i38p7gkDZv+NduyPX/3Vt3Zy9HwMRekI6ZFbDd/bPFl+i97rA43/sVUwubfQUT3PBORF/wCZ30
SWcpiyVdhNq55q6X7p8DsYorWTNZR9zcJRARzdjviepgyTvjMsaceP26h+ZJbt9Ox+GMbS4iTouh
EExW+yd9ZvL3xMMu3cwRfk7zYw9Ks9rPacwi0Ze782apac8fQVEbMasCkVit4cKpR5bn9JcNuDAW
ahU80D3N0aSRLE1BvqOwbX4ps5vyj/+5vf9WjlNH/XmsuJsIC3PVs8cz15uHxY5NNttdqJJz+H/q
qK4QIe/7c20GbXDM/fgDQMYCDA1WWgytopHGG04K4Q39pGx2i/uWVmgqpdGHSiOaMOl/w9TcXDp8
R2meeuuX3fova/1GX2p856WTJX6ciDlEAGL4ZRqmmPU9AAqJ0PVDbHioKu/4tfJWT08btIzgt+tR
D+9ttTeczFqcjJ0FnihNvU8kz7Q5nQrUNT26rIH28wwd3eWQfkiTeeRwWfIJOK6MXmnzwSKhRZQa
2SXD7TUqqqh+BF4EyT7quRfGFJ9ejpvn03aNZ98ok6dhnjEKfNCtIMG0hzLJESooyW9pFAK9pyJK
Q0dxJA6e399+ctQjAllFrtStpoLb7yrbBHIuSxbd3t4tsEqQ+Y4yWGT8HC36tViNMbt0UNa7F+Mi
dH6OEAlfspIL3oRbLnARHMZH2K/evm7WB0pt+N0iMWP5oc02A/V+7GYD6ver18r78/T8DArNH9oN
R26c7GbA7Wr918vmy9ej9z9eyP0LJheo+PMGCqOOCOzo+ApmGrQpdbM2GPlfZj5D8/5RWm8rKWKq
fq2At5hMuAS/OM9DXaQoWSeUjRwXbzdyyJ+IFH6K6qhdAL9K+LRZNmk6qZ2PJbFm4TPehPUUzwrr
owJNGnxwksFrBq3ZbYj49Yf7j9cfa0or8Tk3N0JbbVQaA7BufO6IjYqALMTBiB9Ghl1DQj+TsNG5
Q1oN12za37vEMBGsXwFZi0dvgdaBFwtfqtT1jWjhQDCzwEXASBWBVzsMMgERiQuajj9EMCDXvtZ6
vzvsno/e5PtbtX83876cqsOx8wzPeP0yq+UpJaijXBGGsesTQl30WH9lURJi0Y4/AbdJnHldHxuG
IYuTxeUPN2CpYI5BQumHNZk3sezByXGNN9TutO+YxHMob6oyXsqPN3dWggtaxSwnWkf44yt1awsg
qRlsX0aGo4QuZpKwrcJpI7LqdXes3va7NWXLMeCRo2dKY0yisxn07fXwhRwvjVQjo/SInZ7G7YPJ
f1X6A3Qv2QKU3rz95h3eqvXm+RwrOTSIkr2+7L5As9rxzvyNKSPIxgLtwbld715dHUm6iWUs0t+D
fVVhiV3lfd7t5WfXIP/Gqnk376OFa4ABzUbR4eZYGerotHl5Aht7PiRiqB/vpHt9Pq1eYPvO8yHp
to3EX8EYCN8CM3XfXGNS1LNr/0NCYUFxrUWG1ZKNcVvkTlSoEyX0y3Io6XQ+xFYYqlrDKiltOqDZ
fjRmpF1etnY9dJ1TloQh4TOCG9X5pYjW26kjkshAQigeldMkZohRbpxc6KWlC1befIwj9AhpuNLh
wvGcXKaQOhxHpRhgn8a96+yo52txR/lixEfDoxl+dkHdzSU224cfgha2fdrvNk/2qYOnnyXSJzfW
sFuogzmqU/vRDRN2mmNgb73ZfqFws8ppm1eXrk/IJRFDWiAf44N0IMTxaxrSYaBUKCNnHAk/PYC/
x73voyyjXQw/nmxQWTdVUyckQOsZ6bFMtG8yWPMks+ooW8zU/MhPoEwBFe2yiQVaWODRef0ycXwt
o+sYkMOFfWCEupbDldAM9M+2SUd4zr8AdaWhlc4f4wjYhd6fiySnLx2THoH6UDqSSYbsogZYDOCg
mfT/skc2or1af+06nrHA47/kUgWKyKk2GMuMZ7TDoTo97XSGvRWWVtkAIHItWNP4RIZ+Jujb0z9l
QkNM8yW3g2r+II6xUVXDNVsqUCrjKMHsuXDg5NjxYx1FLIefd50TddaDMoCtWp/2m+N3yl+biqUj
FyN48X+VXU1z2zYQvfdXeHLqQe3YiSfNJQdKpmSO+CGTlJn0opFtRdUkljWS3Un764u3AEEA3KXd
Sz64SxAEwMUCeO8JI1qtteKKZjYCRw36SsPJQ+5KSw+golp4SP+MtP2UzFl/V7vIgSqkVfb53Y/1
/gHJ+Qh/4Jhk9M/6cT3CYclhtx+d1t82qsDdw2i3f95s0S6ju8O3d57cx1/r48NmjzjbNZmL59ip
eWe3/rH7N9CSJCFCDVoLRbHIBHAujvbtewjxpHWeAqck+frH6WGVAjkR5o1s6hYOD2eEI+gVvQ89
3d0dwYQ4Pr087/b+J4/8iAd1WKh3XeaThYogOIBDjzNocOWSxrlgnSZ5K/owTrzzzYmaL6SkpwS0
NF9m42ClHiZgk8RSOAJTcLlDpgMcQ5JKi9QDQ1tgVfU1U7mGCuQWMOg0sYpOk6QWZtNycsETTHFf
fXF+lfCgJ5iTerkSi/3AZ33K8pGn8SuLaOA3f9NkTA8SjmzLCc/z1+cvH96zpItuQ+JPiLgwHYke
UT3l4p70JcxBIfi/8oVPCP9T0f7SSo2/We0pmBn208C+FOkvBkpR9llAPZqRBCJef3ypuQZHLMX0
ylVTce/x+N2egYDTPSgqhaImSuc+jBtCUULrmpjQ+8L96Hj/XUND6erhqCLpdzotenjcnLZ9iJv6
qyooyZqRkomlgv8hetwsk7j+fGmBmyoDBGisV8KlO41n4yIFOqosIUvCvphYWR3Dnh4Pavr8jfT+
VPJx//1Ervf6+pGbQTUqBSK2TK9rQREC616cv7/0O2FBXBBRVQuQUVJ/iSrhhDTGqU5FwkYRO+h0
3SpN4EHKkeGoygHxBRaqqZpoUo8nZeBfEPp0SCZgOQH1ze9qZmmSL7+sJP6aW2QTR/MWdMfngW/t
FQ+IZQbr1ebuZbvFxOcgL7zjsWiGGedrJWBXLPhN+KbpQ5vPrryddfyfucFOGctxFeXQ70lqAN1b
FHWb3sHKNsWbXs7vfY147/dniHZ18xtbrj+zQ9kBkjuVtA4KkOf8REz0+iYX1jtkXhRJVeTSekw/
pSzUEjCSRJ1tS2tngvIHBTScbo5NA2rDKwpuKsagw4mDwTS5mn0Msya4vbUMvJdOH5dVgFDtIgfJ
FWkvKFIRRuL1FrjNWjWpfq1u+fgS3viGh2gmKPMEbRh4jME/I/Md8OoQpVJlLBi+czVxRk/9YoGd
13DnUstjFTxNSU2Z677WzJRkpLvmEQKAGW3OcYO2AnKBOTovuhChofYcI2U+jfNJzEBsu8+4V8vr
AKpnoLTK/6x4OpxGZ6laPb0cdKC9Xu+3QZKvFqDEaAo2VTi7FarwjJTpLGtXvwJMqYAYyM97fQKh
MGRgVIt41ZJgarJOzQ2L33D2rIba5BdfP9ePmz0BXbk/0BrzOF4EIU+vtnDS1EX6X09qGUswm9HZ
48vz5udG/QOs9t+Jyd/m3tjxorJnlOzZc2J3X+R2eN+LysDKfChaMUdw4ZcNVdVBSG/TaCeoSjaL
KNz99MN+U0m7JdqBai1PP9qpPVJPVZu/UhbxXFTW3+bL/LPpqWogkiieuGjpXnRoaVNNpgNFtRn6
/xgVvWS1vJmm0UzEmRs5S/4VkCGCp7PMK7VaAl1Ihg2aGKsnTSHcGJ7Yw/p5fYYc5r4nUmj6IhGa
yyQdr9iroVyi5TEL8raY9/MVpRu8qE4QLYRXCp86KVX75XUSpf29VOh8s1kYBMRBlBoYZXB5dSjC
qYynbypLHAykZn5TcStiR69cDnuN+f2AVdnL/ttU2BK9BYVVn/pOTiEd3VpnZbS45n1aRj8rieAb
icrMMdM5N6M5QLrLYbW0W0YnJqo8bF6FZFHDiSNPTckPWebmRl1KZ8QdQuCfyv1ZRdmCZ046iR5O
u/BrNMT7IHVlGp8/P330RqxTkdhGnH7/BXYi3PfrDPiJyqnGRUUiRbUg/q55UQPa4Wa2TcckTy8l
elmWFOFw86pi5IOHZEGSQsvirs6/fPKUpBxDzGMqrcfyShSztz65RAiaLKIhBBU1BEmi8NtrrXri
ahquytsvM2+SHI0giqaGjhBM9fg1/pBxt5jqzQk/r0CZ1uTp781xvfXkkeZLaZ3QhvJQvkQ4XNO/
EMP4+Am5SsPBetaDYuH99kYJqYJMh1B8cSGUy/2AsBesvh64ukWYS2wAHWyQ3ia/3pj7D1XxRKY4
awAA
--===============8354455033075202889==--

