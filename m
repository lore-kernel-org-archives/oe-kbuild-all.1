Content-Type: multipart/mixed; boundary="===============6995664172760326845=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [lkp] [+582 bytes kernel size regression] [i386-tinyconfig] [9ae4d849d7] PM: QoS: Introduce cpufreq minimum load QoS
Date: Wed, 27 May 2020 11:40:51 +0800
Message-ID: <20200527034051.GA15532@339aed63208d>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6995664172760326845==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


FYI, we noticed a +582 bytes kernel size regression due to commit:

commit: 9ae4d849d7833bd039e4e0b03ec8cf01fec2e60f (PM: QoS: Introduce cpufre=
q minimum load QoS)
url: https://github.com/0day-ci/linux/commits/Benjamin-Gaignard/Introduce-c=
pufreq-minimum-load-QoS/20200526-232909

Details as below (size data is obtained by `nm --size-sort vmlinux`):

81394601: Merge branches 'acpi-video' and 'acpi-dptf' into linux-next
9ae4d849: PM: QoS: Introduce cpufreq minimum load QoS

+-----------------------------------------+----------+----------+-------+
|                 symbol                  | 81394601 | 9ae4d849 | delta |
+-----------------------------------------+----------+----------+-------+
| bzImage                                 | 439424   | 439680   | 256   |
| nm.r.cpufreq_minload_qos_fops           | 0        | 128      | 128   |
| nm.t.cpufreq_minload_qos_read           | 0        | 80       | 80    |
| nm.t.cpufreq_minload_qos_write          | 0        | 74       | 74    |
| nm.T.cpufreq_minload_qos_remove_request | 0        | 52       | 52    |
| nm.t.cpufreq_minload_qos_open           | 0        | 48       | 48    |
| nm.d.cpufreq_minload_qos_miscdev        | 0        | 40       | 40    |
| nm.T.cpufreq_minload_qos_add_request    | 0        | 37       | 37    |
| nm.T.cpufreq_minload_qos_update_request | 0        | 37       | 37    |
| nm.t.cpufreq_minload_qos_release        | 0        | 31       | 31    |
| nm.d.cpufreq_minload_constraints        | 0        | 28       | 28    |
| nm.T.cpufreq_minload_qos_request_active | 0        | 11       | 11    |
| nm.t.cpufreq_minload_qos_init           | 0        | 10       | 10    |
| nm.T.cpufreq_minload_qos_limit          | 0        | 6        | 6     |
+-----------------------------------------+----------+----------+-------+



Thanks,
Kbuild test robot


--===============6995664172760326845==--

